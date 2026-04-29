import pytest
import tempfile
from pathlib import Path
from deploy import rtitle, stitle


class TestTitleRegex:
    def test_rtitle_extracts_title(self):
        src = r'\header { title = "Ave Maria" }'
        match = rtitle.findall(src)
        assert match == ["Ave Maria"]

    def test_stitle_extracts_subtitle(self):
        src = r'\header { subtitle = "Bach/Gounod" }'
        match = stitle.findall(src)
        assert match == ["Bach/Gounod"]

    def test_rtitle_no_match_returns_empty(self):
        src = r'\header { composer = "Mozart" }'
        match = rtitle.findall(src)
        assert match == []


class TestRunLily:
    def test_missing_title_raises_value_error(self):
        from deploy import run_lily

        with tempfile.TemporaryDirectory() as tmpdir:
            # Create a .ly file without title
            ly_file = Path(tmpdir) / "test.ly"
            ly_file.write_text(r'\header { composer = "Test" }', encoding='utf8')

            with pytest.raises(ValueError, match="No title found"):
                run_lily(ly_file, "lilypond", Path(tmpdir) / "out")
