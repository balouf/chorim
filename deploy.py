import argparse
import subprocess
import re
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor, as_completed
from tqdm.auto import tqdm
from string import Template
import json
import shutil


parser = argparse.ArgumentParser()
parser.add_argument("-l", "--lilypond", default="lilypond", help="path to Lilypond executable")
parser.add_argument("-d", "--dest", default="build", help="destination folder")
parser.add_argument("-s", "--source", default="lilypond", help="source folder")
args = parser.parse_args()
lily = args.lilypond
dest = args.dest
source = args.source
rtitle = re.compile(r'\Wtitle\s*=.*?"(.*)"')
stitle = re.compile(r'\Wsubtitle\s*=.*?"(.*)"')

def run(cmd):
    result = subprocess.run(
        cmd,
        shell=True,
        capture_output=True,
        text=True,
        encoding='utf-8',
        errors='replace'  # Replace undecodable bytes instead of crashing
    )
    if result.returncode != 0:
        raise RuntimeError(f"Command failed: {cmd}\n{result.stderr}")
    return result


def run_lily(file, lily, dest):
    with open(file, encoding='utf8') as f:
        src = f.read()
        try:
            title = rtitle.findall(src)[0]
        except IndexError:
            raise ValueError(f"No title found in {file}")
        subtitle = stitle.findall(src)
        if subtitle and subtitle[0].strip():
            title = f"{title} - {subtitle[0]}"
    pdfs = []
    stem = file.stem
    target = dest / stem
    target.mkdir(parents=True, exist_ok=True)
    run(f'{lily} -o {str(target)} -dno-point-and-click {str(file)}')

    def convert_midi_to_mp3(midi):
        wav = midi.with_suffix(".wav")
        mp3 = midi.with_suffix(".mp3")
        run(f"timidity {str(midi)} -Ow -o {str(wav)}")
        run(f'ffmpeg-normalize {str(wav)} -nt peak -t -1 -c:a mp3 -o {str(mp3)}')
        wav.unlink()
        midi.unlink()

    midi_files = list(target.glob('*.mid*'))
    with ThreadPoolExecutor() as executor:
        list(executor.map(convert_midi_to_mp3, midi_files))
    for f in target.glob('*'):
        if f.is_file():
            suf = f.suffix
            if suf not in ['.pdf', '.mp3']:
                continue
            new_name = f.stem.replace('--', '-')
            f.replace(target / f"{new_name}{suf}")
            if suf == '.pdf':
                if new_name.endswith('-piano'):
                    pdfs.append('-piano')
                elif new_name.endswith('-full'):
                    pdfs.append('-full')
                else:
                    pdfs.append('')

    # Collect all MP3 files to create track entries for each
    mp3_files = list(target.glob('*.mp3'))
    tracks = []

    if len(mp3_files) == 1:
        # Single output file: file_stem equals stem
        tracks.append((title, stem, stem, pdfs))
    else:
        # Multiple output files: create entry for each with suffix
        for mp3_file in sorted(mp3_files):
            file_stem = mp3_file.stem
            # Extract suffix (e.g., "1-Fortuna" from "carmina-1-Fortuna")
            if file_stem.startswith(stem + '-'):
                suffix = file_stem[len(stem) + 1:]
                track_title = f"{title} - {suffix}"
            else:
                suffix = file_stem
                track_title = f"{title} - {suffix}"
            tracks.append((track_title, stem, file_stem, pdfs))

    return tracks


def run_everything(lily, source, dest):
    input_files = [file for file in Path(source).glob('*.ly')]

    dest = Path(dest)
    if dest.exists():
        shutil.rmtree(dest)
    dest.mkdir(exist_ok=True)

    with ThreadPoolExecutor() as executor:
        print("Lilypond compilation started...")
        futures = [
            executor.submit(run_lily, file, lily, dest)
            for file in input_files
        ]
        tracks = []
        for future in tqdm(as_completed(futures), total=len(futures)):
            try:
                tracks.extend(future.result())  # result is now a list
            except Exception as e:
                print(f"Error processing file: {e}")
                raise
    tracks = [{'name': t[0], 'path': t[1], 'file': t[2], 'pdfs': t[3]}
              for t in sorted(tracks, key=lambda t: t[0])]
    # print(tracks)

    with open('chorim/index.tpl', 'rt', encoding='utf8') as source_file, \
        open(dest / 'index.html', 'wt', encoding='utf8') as target:
        template = Template(source_file.read())
        target.write(template.substitute(tracks=json.dumps(tracks)))

    # Copy styles directory
    styles_src = Path('chorim/styles')
    styles_dest = dest / 'styles'
    if styles_src.exists():
        shutil.copytree(styles_src, styles_dest, dirs_exist_ok=True)

    # Copy JavaScript modules
    js_src = Path('chorim/js')
    js_dest = dest / 'js'
    if js_src.exists():
        shutil.copytree(js_src, js_dest, dirs_exist_ok=True)

    # Copy assets if they exist
    assets_src = Path('chorim/assets')
    assets_dest = dest / 'assets'
    if assets_src.exists():
        shutil.copytree(assets_src, assets_dest, dirs_exist_ok=True)


if __name__ == '__main__':
    run_everything(lily, source, dest)
