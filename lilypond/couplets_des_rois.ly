% Created on Mon Sep 20 15:23:38 CEST 2010
\version "2.22.0"

#(set-default-paper-size "a4")

%\paper { indent = 0\cm}

\header {
  title = "Couplets des rois"
  subtitle = "Les 2 Ajax"
  composer = "Offenbach"
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
\time 2/4
\tempo 4 = 144
\set Timing.beamExceptions = #'()
\key f \major
}


bass_music = {
  R2*32
  r8 f^\p e d cis8 16 16 8 8 d8 16 16 bes8 8
  c c c c f \breathe
  f e d cis8 16 16 8 8 d8 16 16 bes8 8
  c c c c f r r4
  R2*3 r2\fermata^"Achille"R2*27
  r8 f e d cis8 16 16 8 8 d8 16 16 bes8 8
  c c c c f \breathe
  f e d cis8 16 16 8 8 d8 16 16 bes8 8
  c c c c f r r4
  R2*31
  r8 f e d cis8 16 16 8 8 d8 16 16 bes8 8
  c c c c f \breathe
  f e d cis8 16 16 8 8 d8 16 16 bes8 8
  c c c c f r r4
  R2*3 \break 
  r4\fermata r8^"solo" c' c r c r c a16 c d8 8 c a16 c e8 8 c a16 c f8 8
  e r d r d c c4~2~4
  r8 c c r c r c a16 c d8 8 c a16 c e8 8 c a16 c f8 8
  e r d r d c c4~2~4
  r8 c8 4 d8 es8 8 d es d d c d c bes4 r8 g g r g r bes a16 a a8 c
  c bes16 16 8 d d c16 16 8 f e d c bes a f a bes c4 e, f8
  \breathe
  f^"tutti" e d cis8 16 16 8 8 d8 16 16 bes8 8
  c c c c f \breathe
  f e d cis8 16 16 8 8 d8 16 16 bes8 bes'8
  c c c c f,8. \breathe
  16^\f 8. 16 8. 16 8. 16 2~2
\fine
}
	


bass_lyrics = \lyricmode {
  Ces Rois rem -- plis de vail -- lan -- ce plis de vail -- lan -- ce
  C'est les deux A -- jax
  Ces Rois rem -- plis de vail -- lan -- ce plis de vail -- lan -- ce
  C'est les deux A -- jax!
  
  Voi -- ci le bouil -- lan -- t~A -- chil -- le, Bouil -- lan -- t~A -- chil -- le.
  Le grand Myr -- mi -- don
  Voi -- ci le bouil -- lan -- t~A -- chil -- le, Bouil -- lan -- t~A -- chil -- le.
  Le grand Myr -- mi -- don!
  
  C'est lui l'é -- poux de la Rei -- ne poux de la Rei -- ne
%  C'est le ma -- ri de la Rei -- ne Ri de la Rei -- ne
  Le roi Mé -- lé -- nas
  C'est lui l'é -- poux de la Rei -- ne poux de la Rei -- ne
%  C'est le ma -- ri de la Rei -- ne Ri de la Rei -- ne
  Le roi Mé -- lé -- nas!
  
  Le roi bar -- bu qui s'a -- van -- ce, 
  Bu qui s'a -- van -- ce, Bu qui s'a -- van -- ce,
  C'est A -- ga -- mem -- non! __
  Et ce nom seul me dis -- pen -- se, 
  Seul me dis -- pen -- se, Seul me dis -- pen -- se,
  D'en di -- re plus long: __
  J'en ai dit as -- sez, je pen -- se, en di -- sant mon nom.
  Le roi bar -- bu qui s'a -- van -- ce, 
  Bu qui s'a -- van -- ce, Bu qui s'a -- van -- ce,
  C'est A -- ga -- mem -- non A -- ga, A -- ga -- mem -- non
  
  Le roi bar -- bu qui s'a -- van -- ce, 
  Bu qui s'a -- van -- ce, C'est A -- ga -- mem -- non
  Le roi bar -- bu qui s'a -- van -- ce, 
  Bu qui s'a -- van -- ce, C'est A -- ga -- mem -- non
  A -- ga, A -- ga, A -- ga -- mem -- non! __
  
}


bass = \new Staff \with {instrumentName=""
  shortInstrumentName =""} <<
  \armure
  \clef bass
  \accidentalStyle modern-cautionary
  \set Score.rehearsalMarkFormatter = #format-mark-box-letters
  \relative c {
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
