% Created on Mon Sep 20 15:23:38 CEST 2010
\version "2.22.0"

#(set-default-paper-size "a4")

%\paper { indent = 0\cm}

\header {
  title = "La Traviata (Brindisi)"
  subtitle = ""
  composer = "Giuseppe Verdi (1813-1901)"
  tagline = ""

}

conductor_size = 20
individual_size = 20



armure = {
  \set Staff.midiInstrument = "trumpet"
  \set Staff.midiMinimumVolume = #0.7
  \set Staff.midiMaximumVolume = #0.9
\accidentalStyle modern-cautionary
\compressEmptyMeasures
\time 3/8
\tempo "Allegretto" 4. = 69
\set Timing.beamExceptions = #'()
\key bes \major
}


bass_music = {
  R4.*21 \mark \default
  R4.*22 \mark \default
  R4.*24 \mark \default
  \break
r8 bes4~^\f->\( 8[ aes] g f-.\)
f16([ e f g)] es8-. 16([ d es f)] d8-.
bes'4~->\( 8[ aes] g\) f-.
\slashedGrace g16 f16([ e f g)] es8-. 
\slashedGrace f16 es16\([ d es f\)] d4 r8 r4.\fermata
\mark \default
R4.*20 \mark \default
R4.*24 \break
r8 bes'4^\<~4\! bes,8-.
\mark \default
g'4.~8 bes,-. g'-.
g-. bes,-. g'-.
g[ \grace {aes16 g8} fis8] g
bes4.~^\f^\> 8 aes g 
f-. \slashedGrace g16 f^\pp e f g
f8-. \slashedGrace g16 f e f g
f4\( es8 bes\) r 
bes8-.^\mf
g'4.~8 bes,-. g'-.
g-. bes,-. g'-.
g[ \grace {aes16 g8} fis8] g
c4.->~8 bes aes g-. \slashedGrace aes16
g^\pp fis g aes f8-. \slashedGrace g16
f[( e f g]) \mark \default es4 r8
R4.*17 \mark \default \break
bes'8-.^\pp f-. d-.
bes'8-. f-. d-.
bes'8-. f-. d-.
bes'8-. f-. d-.
bes'8-. f-. d-.
bes'8-. f-. d-.
a'8-. f-. es-.
a8-. f-. es-.
\break 
bes'8-. f-. d-.
bes'8-. f-. d-.
bes'8-. f-. d-.
bes'8-. f-. d-.
bes'8-.[ f-.] d-.
bes'8-.[ f-.] d-.
f-. bes-. d-.
f,-. bes-. d-.
f,-. bes-. d-.
f,-.[ a-.] f-. 
bes, r b c r cis d-. r es-. f-. r f-.
bes, r b c r cis d-. r es-. f-. r f-.
bes-.^\f^\< f-. bes-. f-. bes-. f-. 
bes-. f-. bes-. f-. bes-. f-.
<bes bes,>4.^\ff~4.~4.~4.~8 r4 \fine
}
	


bass_lyrics = \lyricmode {
  Ah! __  _ Li -- biam -- a -- mor fra' __
  ca -- li -- ci più cal -- di __ ba -- ci _ a -- _ vrà.
  
  Ah! __ Go -- dia -- mo, la taz -- za, la
  taz _ -- za(e)~il can -- ti -- co,
  la not -- _  te ab -- bel -- la __ _ e il __
  ri -- _ so;
  
  in que -- sto, in que -- _ sto
  pa -- _ ra -- di -- so
  ne sco -- pra __ _ il __ _
  nuo -- vo __ dì.
  
  Ah sì go -- dia -- mo,
  go -- dia -- mo, go -- dia -- mo,
  la taz -- za~(e) il can -- ti -- co,
  la not -- te~ab -- bel -- la~(e) il ri -- so;
  go -- dia -- mo, go -- dia -- mo, go -- dia -- mo,
  in que -- _  sto pa -- _ ra -- di -- so
  ne sco -- pra, ne sco -- pra il
  nuo -- _ vo 
  dì, ne sco -- pra~il nuo -- vo,~il nuo -- vo
  dì, ne sco -- pra~il nuo -- vo,~il nuo -- vo
  dì, sì, ne sco -- pra, ne sco -- pra il
  nuo -- _ vo dì! __
}


bass = \new Staff \with {instrumentName=""
  shortInstrumentName =""} <<
  \armure
  \clef bass
  \accidentalStyle modern-cautionary
  \set Score.rehearsalMarkFormatter = #format-mark-box-letters
  \relative c' {
\bass_music}
  \addlyrics {\bass_lyrics}
>>

#(set-global-staff-size conductor_size)
\book {
  \score {
        \layout {
  \context {
    \Staff
    \RemoveEmptyStaves
  }
}
      \bass

  }
  \score {
    \unfoldRepeats
    <<
      \bass
    >>
    \midi {}
  }
}
