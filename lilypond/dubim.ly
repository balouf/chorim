% Created on Mon Sep 20 15:23:38 CEST 2010
\version "2.22.0"

#(set-default-paper-size "a4")

%\paper { indent = 0\cm}

\header {
  title = "Warm-up"
  subtitle = ""
  composer = "Leonard Bernstein"
  tagline = ""

}

conductor_size = 26
individual_size = 20



armure = {
  \set Staff.midiInstrument = "trumpet"
  \set Staff.midiMinimumVolume = #0.7
  \set Staff.midiMaximumVolume = #0.9
\accidentalStyle modern-cautionary
\compressEmptyMeasures
\time 4/4
\tempo 4 = 200
\set Timing.beamExceptions = #'()
\key f \major
}


bass_music = {
  \repeat volta 2 {
  c,8 e4 d8 f4 e8 g~8 f a4 g8 bes4 a8 \break 
  c1~2 r8 d4 c8 \break es4.-> aes,-> c4->~8
  f,4.-> g-> c,8~ \break 1~2 r8 d4 e8 \break 
  f g a f~4 g8 a bes a4. e8 f g f~\break
  1~1
  }
 \fine
}
	


bass_lyrics = \lyricmode {
Du -- bing, du -- bang, du -- bong.
Du -- bing, du -- bang, du -- bong. __
Du -- bi ding, dong, ding, dong, ding, dong. __
Du -- bi ding -- i -- di -- bing,
ding -- i -- di -- bang,
ding -- i -- di -- bong. __
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
