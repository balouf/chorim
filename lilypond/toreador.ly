% Created on Mon Sep 20 15:23:38 CEST 2010
\version "2.22.0"

#(set-default-paper-size "a4")

%\paper { indent = 0\cm}

\header {
  title = "Marche des Toreadors"
  subtitle = "from Carmen"
  composer = "Georges Bizet (1838-75)"
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
\tempo "Allegro giocoso" 4 = 116
% \set Timing.beamExceptions = #'()
\key a \major
}


bass_music = {
  R2*2 \bar "||" R2*12 
  r8 bes'16^\f 16 8 r
  R2*4 \tuplet 3/2 { r8 r e,} 
  \tuplet 3/2 {e e e} 2~2 8 r r4
  R2*3 
  \bar "||" \mark\default
  a8^\ff a e r16 e a8 16 16 e8 8
  a a gis8. 16 fis8 8 e e
  r8 d'16 d a8 8 d d16 d a8 8
  r2 r4 r8. e16 a4 e8 8 a a e e a a gis r16 16
  fis8 16 16 e8 8 r c'16 e g,8 8 e' c16( e) g,8 8
  r8 e16 16 8 16 16 8 16 16 a8 r 
  \bar "||" \mark\default
  R2*16
 \bar "||" \mark\default 
  R2*8 \bar "||" r2 r
  cis8^\ff gis16( 16) cis8 d cis r16 gis cis8 r r2 r
  r8. gis16^\ff 8 r r8. 16 8 r r8. 16 8 r 
  r8. 16 8 r16 e
  \bar "||" \mark\default 
  a4~8 r R2*15 \bar "||" R2*4
  \bar "||" \mark\default 
  d,8 e fis g a4 b8. cis16 d2 8 r
  a a d( cis) b a cis4 b a2~8 r r4
  b g8 r e'4 d8 r 
  cis4 \appoggiatura {d16( cis} b8.) cis16
  d4 b8 r
  d, e fis g a4 b8.( cis16) d2~8 r r4
  \bar "||" \mark\default 
  R2*4
  r8. d,16^\f fis8 r
  R2 R2*4
  r8. d16^\f fis8 r
  R2*2
  r8 cis^\ff dis dis e e e e 
  \bar "||" \mark\default 
  a, r r4
  R2*15
 \bar "||" \mark\default 
 R2*3 R2*2 R2*2 R2 r4 r8. f'16^\f^\<
 bes8 f d bes f'8.^\ff r16 e4^\> d c
 b2^\p~8 r r4
r8 e^\f-. dis-. e-. f-. c'-. b-. d-.
c-.( \slashedGrace c) a8-. f-. a-.
c,-. cis-. d-. e-. 
 \bar "||" \mark\default 
f-. r r4
R2*2
r4 r8. a16^\f bes2 8 r r4
R2*6
r4 \tuplet 3/2 {r8 fis8 8} b b r4 R2
r4 \tuplet 3/2 {r8 b^\ff b} <b e,>2~2
<e e,>8 r r4 r2
\bar "||" \mark\default 
e4 fis8.( e16) cis4 4
8.( b16) cis8. d16 cis4 8 r
d4 b8. e16 cis2
a4 fis8. b16 e,4~8 r
b' b b4 8 fis' e d cis( b cis d) cis4~8 r
gis8. cis16 4 8 8 bis8. dis16 gis2~2
r8 fis eis fis b,( cis) d4
r8 <a cis> <a e> <d fis> <cis e>4 8 r
r4 cis d e8 r
\bar "||" \mark\default 
  a,8^\ff a e r16 e a8 16 16 e8 8
  a a gis8. 16 fis8 8 e e
  r8 d'16 d a8 8 d d16 d a8 8
  r2 r4 r8. e16 a4 e8 8 a a e e a a gis r16 16
  fis8 16 16 e8 8 r c'16 e g,8 8 e' c16( e) g,8 8
  r2 r4 \tuplet 3/2 {e8^\ff 8 8} 2~4 8 r
\bar "||" \mark\default 
  a2~^\fff 8 r r4 r4 \tuplet 3/2 {e8 e e}
  4 8 r e4 8 r r2 8 8 r4
  8 8 r4 a2~2 a,8 r r4 R2*4
\fine
}
	


bass_lyrics = \lyricmode {
  Les voi -- ci!
  Voi -- ci la qua -- dril -- le!
  Les voi -- ci! Voi -- ci la qua -- dril -- le,
  La qua dril -- le des To -- re -- ros!
  Sur les lan -- ces le sol -- eil bril -- le!
  En l'air to -- ques et som -- bre -- ros!
  Les voi -- ci! Voi -- ci la qua -- dril -- le,
  La qua -- dril -- le des To -- re -- ros!
  Les voi -- ci! Les voi -- ci! Les voi -- ci! 
  
  À bas __ l'Al -- gua -- zil! À bas!
  À bas! À bas! À bas! À bas! À bas! __
  
  Et puis sa -- lu -- ons au pas -- sa -- ge,
  Sa -- lu -- ons __ les har -- dis Chu -- los! __
  Bra -- vo! Vi -- va! Gloire au cou -- ra -- ge!
  Voi -- ci les har -- dis Chu -- los! __
  
  Vo -- yez! Vo -- yez!
  Voi -- ci les ban -- de -- ril -- le -- ros!
  
  Vo --  yez les Pi -- ca -- dors! Comme ils sont beaux! __
  Comme ils vont du fer de leur lance,
  Har -- ce -- ler le flanc des tau -- reaux!
  
  L'E -- spa -- da!
  Es -- ca -- mil -- lo! Es -- ca -- mil -- lo!
  
  C'est L'E -- spa -- da, la __ fi -- ne la -- me,
  Ce -- lui qui vient ter -- mi -- ner tout, __
  Qui pa -- raît à la fin du dra -- me __
  Et qui frap -- pe le der -- nier coup! __
  Vive Es -- ca -- mil -- lo!
  Vive Es -- ca -- mil -- lo!
  
  Ah! bra -- vo!

  Les voi -- ci! Voi -- ci la qua -- dril -- le,
  La qua dril -- le des To -- re -- ros!
  Sur les lan -- ces le sol -- eil bril -- le!
  En l'air to -- ques et som -- bre -- ros!
  Les voi -- ci! Voi -- ci la qua -- dril -- le,
  La qua -- dril -- le des To -- re -- ros!
  
  Vive Es -- ca -- mil -- lo! Ah! __
  Vive Es -- ca -- mil -- lo! Bra -- vo! Vi -- va!
  Bra -- vo! Bra -- vo!
}


bass = \new Staff \with {instrumentName=""
  shortInstrumentName =""} <<
  \armure
  \clef bass
  \accidentalStyle modern-cautionary
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
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
