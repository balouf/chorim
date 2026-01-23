% Created on Mon Sep 20 15:23:38 CEST 2010
\version "2.22.0"

#(set-default-paper-size "a4")

%\paper { indent = 0\cm}

\header {
  title = "Somewhere"
  subtitle = ""
  composer = "Leonard Bernstein"
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
\time 4/4
\tempo "Allegretto" 4 = 84
\set Timing.beamExceptions = #'()
\key e \major
}


bass_music = {
  R1*2
  \mark \default
  R1*8
  \mark \default
  R1*8
  \mark \default
  g4 c,2. a'4 e2. 1 fis e2 fis g4. d8 g fis e d fis fis,4.~2 r1
  \mark \default
  \repeat volta 2 {
  R1*8 
  \mark \default
  g'4 c,2. a'4 e2. 1~ 2. r4
  \volta 1 {R1*14}
  }
 \fine
}
	


bass_lyrics = \lyricmode {
Some -- day, Some -- where, Ouh Ouh
(giv -- ing) Ouh We'll find a way for Some -- where
Some -- ha(ow), Some -- day, Ouh... __ _
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
