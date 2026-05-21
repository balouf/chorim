% Created on Mon Sep 20 15:23:38 CEST 2010
\version "2.22.0"

#(set-default-paper-size "a4")

%\paper { indent = 0\cm}

\header {
  title = "Bache Bene Venies"
  subtitle = ""
  composer = "Carmina Burana"
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
  \repeat volta 4 {
  f,4^\markup {\italic "Last Time Only"} a c c c bes a2 
  c4 4 d bes c2 a \break
  f4 g a g bes a4 2\turn 4 bes g f g2 f \break
  f4 a c c c bes a2 c4 4 d bes c2 a \break
  f4 g a g bes a4 2\turn 4 bes g f g2 f \break
  \bar "||"
  4^\markup {\italic "Always"} g a f g a f f e f d c d2 bes \break
  4 d f f g a f f f g es g f2 2^\markup {\italic "4 X"}
  }
 \fine
}
	


bass_lyrics = \lyricmode {
  Ba -- chus nu -- men fa -- ci -- ens
  ho -- mi -- nem io -- cun -- dum
  red -- dit e -- um pa -- ri -- ter
  doc -- tum et fa -- cun -- dum.
  
  Om -- nes ti -- bi ca -- ni -- mus
  ma -- xi -- ma pre -- co -- nia
  te lau -- dan -- tes me -- ri -- to
  tem -- po -- ra per om -- nia.
  
  I -- stud vi -- num, bo -- num vi -- num,
  vi -- num ge -- ne -- ro -- sum,
  red -- dit vi -- rum cu -- ri -- a -- lem
  pro -- bum a -- ni -- mo -- sum.
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
     \transpose f g { \bass}

  }
  \score {
    \unfoldRepeats
    <<
     \transpose f g { \bass}
    >>
    \midi {}
  }
}
