% Created on Mon Sep 20 15:23:38 CEST 2010
\version "2.24.0"

#(set-default-paper-size "a4")

% \paper { indent = 0\cm}

\header {
  title = \markup { \fontsize #2 \bold "Carmina Burana"}
  composer = "Carl Orff"
  tagline = ""

}


hommes_style = {
  \compressEmptyMeasures
  \set Staff.midiInstrument = "trumpet"
  \set Staff.midiMinimumVolume = #0.7
  \set Staff.midiMaximumVolume = #0.9
  \clef bass
  \accidentalStyle modern-cautionary
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
}



conductor_size = 17
individual_size = 20

bk = \mark \default

armure = {
\time 3/1
\tempo "Pesante "2 = 60
\key d \minor
}

dummy = \relative c' {r1}

fortu_bass_music = \relative c {
  r2 f1^\ff-> e2-> d2-> 2->\breathe
  r2 f1-> e2-> d2-> 2->\breathe
  r2 a'1-> 2-> 2-> 2-> 2-> 2-> \breve->\fermata\breathe\break
  \time 3/2 \tempo 2 = 120 - 132
  r2 f-_^\pp f-_ e-_ e-_ r
  r f-_ f-_ e-_ e-_ r
  r f-_ f-_ \bk e-_ f1-- g-- f2-_ e1.--
  
  r2 f-_ f-_ e-_ e-_ r
  r f-_ f-_ e-_ e-_ r
  r f-_ f-_  e-_ f1-- g-- f2-_ \bk e1.-- \breathe
  
  r2 a-_ a-_ g-_ g-_ r
  r a-_ a-_ g-_ g-_ r
  r a-_ a-_  g-_ f1-- g2-_ e1-- d1.--

  r2 f-_ f-_ \bk e-_ e-_ r
  r f-_ f-_ e-_ e-_ r
  r f-_ f-_  e-_ f1-- g-- f2-_  e1.-- \breathe
  
  r2 f-_ f-_ e-_ e-_ r
  r f-_ f-_ \bk e-_ e-_ r
  r f-_ f-_  e-_ f1-- g-- f2-_  e1.-- \breathe

  r2 a-_ a-_ g-_ g-_ r
  r a-_ a-_ g-_ g-_ r
  r a-_ a-_  \bk g-_ f1-- g2-_ f1-- g1.--

  r2 a-_ a-_ g-_ g-_ r
  r a-_ a-_ g-_ g-_ r
  r a-_ a-_  g-_ f1-- g2-_ e1-- \bk d1.-- \breathe 

  \tempo 2=144
  r2 f^\f-> f-> e-> e-> r
  r f-> f-> e-> e-> r
  r f-> f-> e-> f1-> g-> f2-> e1.

  r2 f-> f-> \bk e-> e-> r
  r f-> f-> e-> e-> r
  r f-> f-> e-> f1-> g-> f2-> e1.
  
  r2 a^\ff-> a-> a-> a-> r
  r2 a-> a-> \bk a-> a-> r
  r2 a-> a-> a-> a1-> a-> a2-> a1.->

  r2 a-> a-> a-> a-> r
  r2 a-> a-> a-> a-> r
  r2 a-> a-> \bk a1-> a2->~a a1->~a2 a1->
  \tempo 2=160
  d,1.->~d~d~d~d~d~d~\bk d~d\fermata \bar "|."
}

fortu_lyrics = \lyricmode {
  O For -- tu -- na,
  Vel -- ut Lu -- na
  Sta -- tu va -- ri -- a -- bi -- lis,
  
  sem -- per cres -- cis 
  aut de -- cres -- cis;
  vi -- ta de -- te -- sta -- bi -- lis
  
  nunc ob -- tu -- rat 
  et tunc cu -- rat
  lu -- do men -- tis a -- ci -- em,
  
  e -- ge -- sta -- tem, 
  pot -- es -- ta -- tem
  dis -- sol -- vit ut gla -- ci -- em.
  
  Sors im -- ma -- nis 
  et in -- a -- nis,
  ro -- ta tu vo -- lu -- bi -- lis,
  
  sta -- tus ma -- lus, 
  va -- na sa -- lus
  sem -- per dis -- so -- lu -- bi -- lis,

  ob -- um -- bra -- ta
  et ve -- la -- ta
  mi -- chi quo -- que ni -- te -- ris;
  
  nunc per lu -- dum 
  dor -- sum u -- dum
  fe -- ro tu -- i sce -- le -- ris.
  
  Sors sa -- lu -- tis
  et vir -- tu -- tis
  mi -- chi nunc con -- tra -- ri -- a,
  
  est af -- fec -- tus
  et de -- fec -- tus
  sem -- per in an -- ga -- ri -- a.
  
  Hac in ho -- ra
  si -- ne mo -- ra
  cor -- de pul -- sum tan -- gi -- te;
  
  quod per sor -- tem
  ster -- nit for -- tem,
  me -- cum om -- nes __ plan -- gi -- te! __
}

fortu_bass = \new Staff \with {instrumentName="Bass"
  shortInstrumentName ="B."} <<
  \hommes_style
  \armure
  \fortu_bass_music
  \addlyrics {\fortu_lyrics}
>>

vulne_armure = {
\time 4/2
\tempo 2 = 120
\key d \minor
}


vulne_mus = \relative c {
\repeat volta 3 {
\set Score.currentBarNumber = #102
r4 d-.^\f^"sempre ben declamato" e-. f-. e2-- d--
g4->( f8 e f4) d-. e2-- \breathe a->(~
4 g8 f) g4 e-. f-. g-. e2->
\time 1/2 d-> \break
\time 4/2
r4 d-. e-. f-. e2-- d--
g4->( f8 e f4) d-. e2-- \breathe a->(~
4 g8 f g4) e-. f-. g-. e2->
\time 1/2 d-> \break 
\time 4/2 \mark 11
f^\p-. e-. f-. g-. f-. e-. f1--
f2-. e-. f-. g-. f1-- 1--
f2-. e-. f-. g-. f-. e-. f1--
f2-. e-. d-. cis-. d1-- 1-- \break 

f2^\f-. e-. f-. g-. f-. e-. f1-- \bk
f2-. e-. f-. g-. f1-- 1--
f2-. e-. f-. g-. f-. e-. f1--
f2-. e-. d-. cis-. d1-- 1--
\time 2/2 R1*4 \bk R1*6
}
}

vulne_lyra = \lyricmode {
  "1.For" -- tu -- ne plan -- go
  vul -- ne -- ra
  stil -- lan -- ti -- bus o -- cel -- lis,
  quod su -- a mi -- chi
  mu -- ne -- ra sub -- tra -- hit re -- bel -- lis.
  
  Ve -- rum est, quod le -- gi -- tur
  fron -- te ca -- pil -- la -- ta,
  sed ple -- rum -- que se -- qui -- tur
  Oc -- ca -- sio cal -- va -- ta.
  
  Ve -- num est, quod le -- gi -- tur
  fron -- te ca -- pil -- la -- ta,
  sed ple -- rum -- que se -- qui -- tur
  Oc -- ca -- sio cal -- va -- ta.  
}
vulne_lyrb = \lyricmode {
  "2.In" __ _ For tu -- ne
  so -- li -- o
  se -- _ de -- ram e -- la -- tus,
  pro -- spe -- ri -- ta -- tis va -- ri -- o
  flo -- re co -- ro -- na -- tus;
  
  Quic -- quid e -- nim flo -- ru -- i
  fe -- lix et be -- a -- tus,
  nunc a sum -- mo co -- ru -- i
  glo -- ri -- a pri -- va -- tus.

  Quic -- quid e -- nim flo -- ru -- i
  fe -- lix et be -- a -- tus,
  nunc a sum -- mo co -- ru -- i
  glo -- ri -- a pri -- va -- tus.
}
vulne_lyrc = \lyricmode {
  "3.For" -- tu -- ne ro -- ta
  vol -- vi -- tur:
  de -- scen -- do mi -- no -- ra -- tus;
  al -- ter in al -- tum tol -- li -- tur;
  ni -- mis ex -- al -- ta -- tus.
  
  Rex se -- det in ver  -- ti -- ce
  ca -- ve -- at ru -- i -- nam!
  nam sub a -- xe e -- gi -- mus
  He -- cu -- bam re -- gi -- nam.

  Rex se -- det in ver  -- ti -- ce
  ca -- ve -- at ru -- i -- nam!
  nam sub a -- xe e -- gi -- mus
  He -- cu -- bam re -- gi -- nam.
}

vulne = \new Staff \with {instrumentName="Bass"
  shortInstrumentName ="B."} <<
  \hommes_style
  \vulne_armure
  \vulne_mus
  \addlyrics {\vulne_lyra}
  \addlyrics {\vulne_lyrb}
  \addlyrics {\vulne_lyrc}
>>



veri_mus = \relative c {
\set Score.currentBarNumber = #136
\time 6/4 \tempo "sempre un poco pesante" 4=60
R2.*2 R2.*2 \time 9/4 R2.*3 \breathe \bar "||"
\time 1/2 R2 \time 6/4 \mark 14 R1.

\time 24/4 \tempo 2.=80
a4(\(^\markup {\dynamic p espr.} c) e f2 e4 g( f) g e2. \breathe
g4( e) e e( g) e g( e) g( a2.)\)\fermata \breathe
\time 1/2 \tempo 2=40 R2 \time 6/4 R1.
\time 24/4 \tempo 2.=80
a,4(\(^\p c) e f2 e4 g( f) g e2. \breathe
g4( e) e e( g) e g( e) g( a2.)\)\fermata \breathe
\time 1/2 \tempo 2=40 R2 \time 6/4 R1.\fermata
\time 12/4 \tempo 2.=80 R1.*6 \mark 15 R1.*2
\time 6/4 R1.*2
\time 9/4 r1. r2.
\time 6/4 R1.\fermata
\time 1/2 \tempo "a tempo come prima" 2=40 r2
\time 6/4 R1.

\time 24/4 \tempo 2.=80
a,4(\(^\markup {\dynamic p espr.} c) e f2 e4 g( f) g e2. \breathe
g4( e) e e( g) e g( e) g( a2.)\)\fermata \breathe
\time 1/2 \tempo 2=40 R2 \time 6/4 R1.
\time 24/4 \tempo 2.=80 \bk
a,4(\( c) e f2 e4 g( f) g e2. \breathe
g4( e) e e( g) e g( e) g( a2.)\)\fermata \breathe
\time 1/2 \tempo 2=40 R2 \time 6/4 R1.\fermata
\time 12/4 \tempo 2.=80 R1.*8
\time 6/4 R1.*2
\time 9/4 r1. r2.
\time 6/4 \bk  R1.\fermata
\time 1/2 \tempo "a tempo come prima" 2=40 r2
\time 6/4 R1.

\time 24/4 \tempo 2.=80
a,4(\(^\markup {\dynamic mp espr.} c) e f2 e4 g( f) g e2. \breathe
g4( e) e e( g) e g( e) g( a2.)\)\fermata \breathe
\time 1/2 \tempo 2=40 R2 \time 6/4 R1.
\time 24/4 \tempo 2.=80 
a,4(\( c) e f2 e4 g( f) g e2. \breathe
g4( e) e e( g) e g( e) g( a2.)\)\fermata \breathe
\time 1/2 \tempo 2=40 R2 \time 6/4 R1.\fermata
\time 12/4 \tempo 2.=80 R1.*2 \bk R1.*6
\time 6/4 R1.*2
\time 9/4 r1. r2.
\time 6/4 R1.\fermata
\time 1/2 \tempo "a tempo" 2=40 r2
\time 6/4 R1.\fermata\fine 
}

veri_lyr = \lyricmode {
  Ve -- ris le -- ta fa -- ci -- es
  Mun -- do pro -- pi -- na -- tur, __
  hi -- e -- ma -- lis a -- ci -- es
  vic -- ta iam __ fu -- ga -- tur, __
  
  Flo -- re fu -- sus gre -- mi -- o
  Phe -- bus no -- vo mo -- re __
  ri -- sum dat, hoc va -- ri -- o
  iam __ sti -- pa -- ta -- flo -- re, __
  
  Cy -- tha -- ri -- zat can -- ti -- co
  dul -- cis Phi -- lo -- me -- na, __
  flo -- re ri -- dent va -- ri -- o
  pra -- ta iam __ se -- re na, __
}


veri = \new Staff \with {instrumentName="Bass"
  shortInstrumentName ="B."} <<
  \hommes_style
  \veri_mus
  \addlyrics \veri_lyr
>>


omnia_mus = \relative c' {
\set Score.currentBarNumber = #189
\time 2/2 \tempo 2=72
R1 \mark 19 R1*2
r2 r4 a^\pp->\fermata~\(
\tempo "sempre molto rubato"
a8 bes a g f e d4\)
a'8\( bes a g f4-- d--\)
a'8\( bes a g f e d4\)
a'8\( bes a g a a \breathe
a4~->\fermata^"rit." 8 bes-- c-- d-- c^"a tempo" bes a4\)
a8\( bes a g a4-- a--\)
a8\( bes c d c bes a4\) \bk
a8\( bes a g a4-- 4--\)

\tempo "a tempo" R1*3
r2 r4 a^\pp->\fermata~\(
\tempo "rubato"
a8 bes a g f e d4\)
a'8\( bes a g f4-- d--\)
a'8\( bes a g f e d4\)
a'8\( bes a g a a \breathe
a4~->\fermata^"rit." 8 bes-- c-- d-- c^"a tempo" bes a4\)
\bk a8\( bes a g a4-- a--\)
a8\( bes c d c bes a4\)
a8\( bes a g a4-- 4--\)

\tempo "a tempo" R1*3
r2 r4 a^\pp->\fermata~\(
\tempo "rubato"
a8 bes a g f e d4\)
a'8\( bes a g f4-- d--\)
a'8\( bes a g f e d4\) \bk
a'8\( bes a g a a \breathe
a4~->\fermata^"rit." 8 bes-- c-- d-- c^"a tempo" bes a4\)
a8\( bes a g a4-- a--\)
a8\( bes c d c bes a4\)
a8\( bes a g a4-- 4--\)
\tempo "a tempo" R1*5 \bk R1*3 \fine
}

omnia_lyr = \lyricmode {
  Om -- ni -- a sol tem -- pe -- rat
  pu -- rus et sub -- ti -- lis
  no -- va mun -- do re -- se -- rat
  fa -- ci -- es A -- pri -- lis, ad __
  A -- mo -- rem pro -- pe -- rat
  a -- ni -- mus he -- ri -- lis
  et io -- cun -- dis im -- pe -- rat
  de -- us pu -- e -- ri -- lis.
  
  Re -- rum tan -- ta no -- vi -- tas
  in sol -- lem -- ni ve -- re
  et ve -- ris auc -- to -- ri -- tas
  iu -- bet nos gau -- de -- re vi --
  as pre -- bet so -- li tas,
  et in tu -- o ve -- re
  fi -- des est et pro -- bi -- tas
  tu -- um re -- ti -- ne -- re.
  
  A -- ma me fi -- de -- li -- ter!
  fi -- dem me -- am no -- ta:
  de cor -- de to -- ta -- li -- ter
  et ex men -- te to -- ta sum __
  pre -- sen -- ti -- a -- li -- ter
  ab -- sens in re -- mo -- ta,
  quis -- quis a -- mat ta -- li -- ter,
  vol -- vi -- tur in ro -- ta.
}

omnia = \new Staff \with {instrumentName="Bass"
  shortInstrumentName ="B."} <<
  \hommes_style
  \key d \minor
  \omnia_mus
  \addlyrics \omnia_lyr
>>

ecce_mus = \relative c {
  \set Score.currentBarNumber = #233
\time 8/1 \tempo "Con ampiezza"
r\breve r\breve r\breve r\breve\breathe
\time 4/2
\tempo "quasi allegretto" 2=120
<f c'>2-.^\p <f a>-. <g bes>-. <f a>-.
<f c'>2-. <f a>-. <g bes>-. <f a>-.
<f c'>2-. <f a>-. <g bes>-. <f a>-.
<c f>-. <d g>-. <f a>1--

<f c'>2-.^\p <f a>-. <g bes>-. <f a>-.
<f c'>2-. <f a>-. <g bes>-. <f a>-. \mark 24
<f c'>2-. <f a>-. <g bes>-. <f a>-.
<c f>-. <d g>-. <f a>1--
\tempo "legato e più sciolto"
f4^\p\(( e) f( g) a( g) a( bes)
c( d) c( bes) a( g) a( bes) 
a( bes) c( bes) a( g) f( e)
f( e) d( e) f1\)

\time 2/2 \tempo "allegro molto" 2=132
a4^\f->-. 4->-. 4->-. a->-.
4.-> g8-. f2-_
a4->-. 4->-. 4->-. f->-.
a->-. 4->-. 4->-. f-. \bk 
a-. bes-. a-. g-. f-. g-. a2-_

a4^\ff->-. 4->-. 4->-. a->-.
4.-> g8-> f2-> \breathe
a4->-. 4->-. 4->-. f->-.
a->-. 4->-. 4->-. f->-.  
a-> bes-> a-> g-> f-> g-> a2-> \breathe
a4^\ff->-. 4->-. 4->-. f->-. \breathe
a4->-. 4->-. 4->-. f->-. \bk
a4->-. 4->-. 4->-. f->-. \breathe
a4->-. 4->-. 4->-. f->-.
<f a>->^\f <g bes>-> \tempo "poco rit." <f a>-> <d g>->
<f a>-> <g bes>-> <f c'>2-> \breathe
\tempo "a tempo" 2=144
1->~^\ff 1~ 1~ 1~ 1~ 1~ \bk 1~ 4->-. r r2
\time 1/2 R2

\time 8/1 \tempo "Come prima ma un poco acc."
r\breve r\breve r\breve r\breve\breathe
\time 4/2
\tempo 2=132
<f c'>2-.^\mp <f a>-. <g bes>-. <f a>-.
<f c'>2-. <f a>-. <g bes>-. <f a>-.
<f c'>2-. <f a>-. <g bes>-. <f a>-.
<c f>-. <d g>-. <f a>1--

<f c'>2-.^\mp <f a>-. <g bes>-. <f a>-.
<f c'>2-. <f a>-. <g bes>-. <f a>-. \bk
<f c'>2-. <f a>-. <g bes>-. <f a>-.
<c f>-. <d g>-. <f a>1--
\tempo "come prima"
f4^\mp\(( e) f( g) a( g) a( bes)
c( d) c( bes) a( g) a( bes) 
a( bes) c( bes) a( g) f( e)
f( e) d( e) f1\)

\time 2/2 \tempo 2=144
a4^\f->-. 4->-. 4->-. a->-.
4.-> g8-. f2-_ \breathe
a4->-. 4->-. 4->-. f->-.
a->-. 4->-. 4->-. f-. \bk 
a-. bes-. a-. g-. f-. g-. a2-_

a4^\ff->-. 4->-. 4->-. a->-.
4.-> g8-> f2-> \breathe
a4->-. 4->-. 4->-. f->-.
a->-. 4->-. 4->-. f->-.  
a-> bes-> a-> g-> f-> g-> a2-> \breathe
a4^\ff->-. 4->-. 4->-. f->-. \breathe
a4->-. 4->-. 4->-. f->-. \bk
a4->-. 4->-. 4->-. f->-. \breathe
a4->-. 4->-. 4->-. f->-.
<f a>->^\f <g bes>-> \tempo "poco rit." <f a>-> <d g>->
<f a>-> <g bes>-> <f c'>2-> \breathe
\tempo "a tempo" 2=152
1->~^\ff 1~ 1~ 1~ 1~ 1~ \bk 1~ 4->-. r r2
\time 1/2 R2

\time 8/1 \tempo "ancora più presto"
r\breve r\breve r\breve r\breve\breathe
\time 4/2
\tempo 2=144
<f c'>2->^\f^"stac." <f a>-> <g bes>-> <f a>->
<f c'>2-> <f a>-> <g bes>-> <f a>->
<f c'>2-> <f a>-> <g bes>-> <f a>->
<c f>-> <d g>-> <f a>1->

<f c'>2->^\f <f a>-> <g bes>-> <f a>->
<f c'>2-> <f a>-> <g bes>-> <f a>-> \bk
<f c'>2-> <f a>-> <g bes>-> <f a>->
<c f>-> <d g>-> <f a>1->
\tempo "come prima legato"
f4^\mf\(( e) f( g) a( g) a( bes)
c( d) c( bes) a( g) a( bes) 
a( bes) c( bes) a( g) f( e)
f( e) d( e) f1\)

\time 2/2 \tempo 2=152
a4^\f->-. 4->-. 4->-. a->-.
4.-> g8-. f2-_ \breathe
a4->-. 4->-. 4->-. f-.
a->-. 4->-. 4->-. f-.  \bk
a->-. bes->-. a->-. g->-. f->-. g->-. a2->

a4^\ff->-. 4->-. 4->-. a->-.
4.-> g8-> f2-> \breathe
a4->-. 4->-. 4->-. f->-.
a->-. 4->-. 4->-. f->-.  
a-> bes-> a-> g-> f-> g-> a2-> \breathe
a4^\ff->-. 4->-. 4->-. f->-. \breathe
a4->-. 4->-. 4->-. f->-. \bk 
a4->-. 4->-. 4->-. f->-. \breathe
a4->-. 4->-. 4->-. f->-.
<f a>-> <g bes>-> \tempo "poco rit." <f a>-> <d g>->
<f a>-> <g bes>-> <f c'>2-> \breathe
\tempo "Presto" 2=160
1->~^\fff 1~ 1~ 1~ 1~ 1~ \bk 1~ 4->-. r r2
\time 1/2 R2 \fine
}

ecce_lyr = \lyricmode {
Ec -- ce gra -- tum et op -- ta -- tum
Ver re -- du -- cit gau -- di -- a,
ec -- ce gra -- tum et op -- ta -- tum
Ver re -- du -- cit gau -- di -- a;

pur -- pur -- a -- tum __
flo -- ret __ pra -- tum,
Sol __ se -- re -- nat __ om -- ni -- a.

Iam -- iam ce -- dant tris -- ti -- a!
Es -- tas re -- dit, nunc re -- ce -- dit
Hy -- e -- mis se -- vi -- ti -- a,

Iam -- iam ce -- dant tris -- ti -- a!
Es -- tas re -- dit, nunc re -- ce -- dit
Hy -- e -- mis se -- vi -- ti -- a,

Es -- tas re -- dit, nunc re -- ce -- dit
Es -- tas re -- dit, nunc re -- ce -- dit
Hy -- e -- mis se -- vi -- ti -- a.
Ah __

Iam li -- que -- cit et de -- cres -- cit
gran -- do nix et ce -- te -- ra,
Iam li -- que -- cit et de -- cres -- cit
gran -- do nix et ce -- te -- ra;

bru -- ma __ fu -- git, __
et __ iam __ su -- git __
Ver __ Es -- ta -- tis __ u -- be -- ra;

il -- li mens est mi -- se -- ra,
qui nec vi -- vit, nec las -- ci -- vit
sub Es -- ta -- tis dex -- te -- ra;

il -- li mens est mi -- se -- ra,
qui nec vi -- vit, nec las -- ci -- vit
sub Es -- ta -- tis dex -- te -- ra,

qui nec vi -- vit, nec las -- ci -- vit
qui nec vi -- vit, nec las -- ci -- vit
sub Es -- ta -- tis dex -- te -- ra.
Ah __

Glo -- ri -- an -- tur et -- le -- tan -- tur
in mel -- le dul -- ce -- di -- nis,
Glo -- ri -- an -- tur et -- le -- tan -- tur
in mel -- le dul -- ce -- di -- nis,

qui __ co -- nan -- tur, __ ut __ u -- tan -- tur __
pre -- mi -- o __ Cu -- pi -- di -- nis;

si -- mus ius -- su Cy -- pri -- dis
glo -- ri -- an -- tes et le -- tan -- tes
pa -- res es -- se Pa -- ri -- dis,

si -- mus ius -- su Cy -- pri -- dis
glo -- ri -- an -- tes et le -- tan -- tes
pa -- res es -- se Pa -- ri -- dis,

glo -- ri -- an -- tes et le -- tan -- tes
glo -- ri -- an -- tes et le -- tan -- tes
pa -- res es -- se Pa -- ri -- dis.
Ah __
}

ecce = \new Staff \with {instrumentName="Bass"
  shortInstrumentName ="B."} <<
  \hommes_style
  \key d \minor
  \ecce_mus
  \addlyrics \ecce_lyr
>>


flore_mus = \relative c' {
  \set Score.currentBarNumber = #442  
  \time 3/4
  \tempo 4=176
  g2^\f->\( d4-.\) \breathe
  g2->\( d4-.\) \breathe
  g->\( d-.\) g->~ 
  \time 2/4 
  4 d-> 
  \time 3/4
  g-> 8( d) g4-.\breathe r2.
  g4->\( d-.\) g->~ 
  \time 2/4 
  4 d-. 
  \time 3/4 \mark 45
  g-> 8( d) g4-.\breathe
  g2^\p 4 \time 2/4 2 \time 3/4 2 4 \time 2/4 2
  \time 3/4 2 4 \time 2/4 2 \breathe
  \time 4/2 d\breve^\mp \breathe d^\p \breathe
  \time 3/4 r4 d-.^\mp d-. \time 2/4 \bk g-_ r
  \time 3/4 r4 d-. d-. \time 2/4 g-_ r
  \time 3/4 r4 d-. d-. g-_ r r
  R2.*3 R2.\fermata^"Coro piccolo"
  \bar "||"\mark \markup { \musicglyph "scripts.ufermata" }
  \time 2/2 \tempo "cullando" 2=66
  R1 \bk R1*2
  \time 3/4 \tempo "poco più mosso" R2.
  \time 2/4 R2 \time 3/4 R2. \time 2/4 R2
  \time 2/2 \tempo "come prima"
  R1*3
  \tempo "poco più moso"
  \time 3/4 R2. \bk \time 2/4 R2
  \time 3/4 R2. \time 2/4 R2
  \time 3/4 R2. \time 2/4 R2
  \time 3/4 R2.*5 \bk
  R2.*8 \time 3/2 R1.*2 \bk
  \time 3/4 R2.*6 R2.\fermata
  \tempo "a tempo" R2.*3 \bk
  R2.*6 \time 3/2 R1.*2 \time 3/4 R2.*2 \bk
  R2.*5 R2.\fermata^"Coro grande"
  
   \tempo 4=176
  g2^\f->\( d4-.\) \breathe
  g2->\( d4-.\) \breathe
  g->\( d-.\) g->~ 
  \time 2/4 
  4 d-> 
  \time 3/4 \bk
  g-> 8( d) g4-.\breathe r2.
  g4->\( d-.\) g->~ 
  \time 2/4 
  4 d-> 
  \time 3/4
  g-> 8( d) g4-.\breathe
  4^\p 4 4 \time 2/4 4 4 
  \time 3/4 4 4 4 \time 2/4 4 4 
  \time 3/4 4 4 4 \time 2/4 \bk 4 4  \breathe
  \time 4/2 d\breve^\mp\breathe d^\p \breathe
  \time 3/4 r4 d-.^\mp d-. \time 2/4 g-_ r
  \time 3/4 r4 d-. d-. \time 2/4 g-_ r
  \time 3/4 r4 d-. d-. g-_ r r
  R2. \bk R2.*2 R2.\fermata^"Coro piccolo" \bar "|."

}

flore_lyr = \lyricmode {
  Flo -- ret, flo -- ret, flo -- ret
  sil -- va no -- bi -- lis,
  flo -- ret sil -- va no -- bi -- lis,
  flo -- ri -- bus, 
  flo -- ri -- bus,
  flo -- ri -- bus et, et
  fo -- li -- is, fo -- li -- is, fo -- li -- is.

  Flo -- ret, flo -- ret, flo -- ret
  sil -- va un -- di -- que,
  flo -- ret sil -- va un -- di -- que,
  nah nime gue -- sel -- len,
  nah nime gue -- sel -- len,
  nah nime gue -- sel -- len,
  ist, ist, ist mir vê, ist mir vê, ist mir vê.
}

flore = \new Staff \with {instrumentName="Bass"
  shortInstrumentName ="B."} <<
  \hommes_style
  \key g \major
  \flore_mus
  \addlyrics \flore_lyr
>>


chrame_mus = \relative c {
  \time 4/4
  \tempo "quasi adante" 4 = 132-144
  \set Score.currentBarNumber = #610
  \mark 61
  \repeat volta 3 {
    R1*10^"X3" \bk R1
    \time 2/2 \tempo 2=60
    << \new Voice = "one" {\voiceOne <d f>2(->^\pp_"ou..." <e g>->) <d f>(-> <e g>)->} 
       \new Voice = "two" {\voiceTwo g,1->~1} >>
    << \new Voice = "one" {\voiceOne <d' f>2(-> <e g>)-> <d f>(-> <f? a>)->} 
       \new Voice = "two" {\voiceTwo g,1->~1} >> \breathe
    << \new Voice = "one" {\voiceOne <d' f>2(-> <e g>)-> <d f>(-> <e g>)->} 
       \new Voice = "two" {\voiceTwo g,1->~1} >>
    << \new Voice = "one" {\voiceOne <d' f>2(-> <e g>)-> <d f>(-> <f? a>)->^"poco rit."} 
       \new Voice = "two" {\voiceTwo g,1->~1} >> \breathe
    \time 4/4 \tempo "a tempo"
    R1 \bk R1*2 \time 3/4 R2. \time 4/4 R1*6
        \time 2/2 \tempo 2=60
    << \new Voice = "one" {\voiceOne <d' f>2(->^\pp_"ou..." <e g>->) <d f>(-> <f? a>)->} 
       \new Voice = "two" {\voiceTwo g,1->~\bk 1} >>
  }
}

chrame = \new Staff \with {instrumentName="Bass"
  shortInstrumentName ="B."} <<
  \hommes_style
  \key g \major
  \chrame_mus
>>

swaz_mus = \relative c {
  \time 3/4
  \tempo "allegro molto" 2. = 76
  \set Score.currentBarNumber = #666
  R2.*4 \mark 67 R2.*3
  r4 r c'->^\f~ 4 8( b) a( b) c4-> 4-> r 
  r2.
  r4 r c->~ 4 8( b) a b c8-> 8-> 4-> r
  \bk r2.
  r4 r c-> 8->( b) a(\< b) c( d) e4->\! r r \time  1/4 r
  \time 3/4
  e2->^\f c4 e2-> c4 e-> c->\< f->~
  \time 2/4 8\!\fermata e-> d-> c-> b4-> 4->
  \key a \major \bar "||" \time 3/4 \tempo "a tempo" 2.=84 \bk
  <a cis>4-> \breathe 2->^\ff~4 \breathe 2->~4 2->~4 2->~4 2~2.~2.~2.~8->-. r a->-.r r4 \fine
}

swaz_lyr = \lyricmode {
  Swaz __ hie gat um -- be,
  daz __ sint al -- le me -- ge -- de,
  die wel -- lent an -- man
  al -- le, al -- le, al -- le, al -- le
  di -- sen su -- mer gan!
  Ah __ ah __ ah __ ah __ ah! __ Sla!
}

swaz = \new Staff \with {instrumentName="Bass"
  shortInstrumentName ="B."} <<
  \hommes_style
  \swaz_mus
  \addlyrics \swaz_lyr
>>


chume_lyr = \lyricmode {
chum, __ chum, __ chum, __ chum, __ chum, __ chum, __
chum, __ chum, __ chum, __ chum, __ chum, __ chum, __
}


chume_mus = \relative c' {
  \new Voice = "melody" {
  \set Score.currentBarNumber = #699
  \time 3/4 \tempo 2.=40 
  R2. \mark 70 R2.*10 \bk R2.
  <<{\voiceOne g2(^\pp a4)-. g2( a4)-. g2.~ g }
    {\voiceTwo c,2. c c~c}
  >>
  \oneVoice
  \breathe
  <<{\voiceOne g'2( a4)-. g2( a4)-. g2.~ g }
    {\voiceTwo c,2. c c~c}
  >>
  \oneVoice
  \breathe
  R2. \bk R2.*10 \bk R2.*5
  <<{\voiceOne g'2(^\pp a4)-. g2( a4)-. g2.~ g }
    {\voiceTwo c,2. c c~c}
  >>
  \oneVoice
  \breathe
  <<{\voiceOne g'2( a4)-.\bk g2( a4)-. g2.~ g }
    {\voiceTwo c,2. c c~c}
  >>
  \oneVoice  R2.*7 \bk R2. \fine
}}


chume = \new Staff \with {instrumentName="Bass"
  shortInstrumentName ="B."} <<
  \hommes_style
  \chume_mus
  \new Lyrics \lyricsto "melody"{\chume_lyr}
>>

were_mus = \relative c' {
  \set Score.currentBarNumber = #784
  \time 4/4 \tempo "allegro molto" 4=138
  R1*6 \mark 79 R1*2
  c4->^\f g-> g-> a-> g8(-> f)-> e(-> f)-> g2-> \breathe
  c4-> g-> g-> a-> g8(-> f)-> e(-> f)-> g2-> \breathe
  g4--^\p e8( f) g4 e8( f) g(-> a g f) e2-- \breathe
  g4--^\pp e8( f) g4 e8( f) g(-> a g f) e2-- \breathe
  \bk \tempo "poco ritenuto"
  g4->^\ff c-> d-> e-> d8-> e-> d-> c-> a4-> \breathe 
  e'-> d8->( e d) c a4-> \breathe \tempo "a tempo"
  g->\( 2->~ 8 a-> g-> e-> g2->~ 8 a-> g-> e-> g->\) \tempo "stent. 8th by 8th" 
  c-> g-> e-> d2-> \tempo "a tempo" c4-> r r2
  R1*3 \bk r2 r4 c'->-.^\fff \fine
}


were_lyr = \lyricmode {
  We -- re diu werlt al -- le min
  von de me -- re~un -- ze~an den Rin,
  des wolt ih mih dar -- ben,
  des wolt ih mih dar -- ben,
  
  daz diu chü -- ne -- gin von En -- gel -- lant
  von En -- gel -- lant le -- ge __ _ _ _ _ _ _ _ _ an mi -- nen ar -- men.
  Hei!
}

were = \new Staff \with {instrumentName="Bass"
  shortInstrumentName ="B."} <<
  \hommes_style
  \were_mus
  \addlyrics \were_lyr
>>

olim_mus = \relative c' {
  \set Score.currentBarNumber = #888
  \time 4/4 \tempo 4=84
  \key a \major
  R1*2 \mark 89 R1*5
  s1*0^"3x"
  \repeat volta 3 {
    \tempo 4=44
    R1*5 \mark \default R1*2
  \time 4/2 \tempo 4=132
  <g b>2\mordent 2\mordent r8 4-> 8-. r8 <e a>4-> <g b>8-.
  <a cis>2\mordent 2\mordent r4 4->-.^\< <g b>->-. <a cis>->-.\!
  <fis cis'>4.->-. 8->-.^\< 1.->-.\!
  \time 4/4 R1*3 r1\fermata
  }
}

olim_lyr = \lyricmode {
  Mi -- ser, mi -- ser! mo -- do ni -- ger
  et u -- stus for -- ti -- ter!
}

olim = \new Staff \with {instrumentName="Bass"
  shortInstrumentName ="B."} <<
  \hommes_style
  \olim_mus
  \addlyrics \olim_lyr
>>

ego_mus = \relative c{
  \set Score.currentBarNumber = #909
  \time 4/4 \tempo4=132
  r1\fermata^"Big impro"
  \mark 91
  R1*2 \caesura
  r1\fermata^"Big impro"
  R1*2
  \bar "||"
  r1\fermata
  r2 r4 <d a'>8-.->^\ff 8-.->
  r1\fermata
  r2 r4 <d a'>8-.->^\ff 8-.-> r1
  \mark \default
  r2 r4 8-.->^\ff 8-.-> 
  r4 8-.-> 8-.-> r4 8-.-> 8-.->
  R1*2
  r4 8-.->^\ff^"accel." 8-.-> r4 8-.-> 8-.->
  r4 8-.-> 8-.-> r4 8-.-> 8-.->
  R1*4 \mark \default R1
  r4 a'8->-.^\ff f->-. r2 \fine
}

ego_lyr = \lyricmode {
Waf -- na! Waf -- na! Waf -- na!
Waf -- na! Waf -- na! Waf -- na!
Waf -- na! Waf -- na! Waf -- na!
Ha ha!}

ego = \new Staff \with {instrumentName="Bass"
  shortInstrumentName ="B."} <<
  \hommes_style
  \ego_mus
  \addlyrics \ego_lyr
>>


intab_mus = \relative c {
\set Score.currentBarNumber = #932
\time 4/4 \tempo 4=132
R1*2 
\tempo "sempre eccitato" 
f16->(^\mf e) d8 8 8 f16->( e) d8 8 8
f16->( e) d8 f16->( e) d8 f16->( e) d8 8 8 \breathe
\tempo "sempre staccatissimo"
e8-.^\pp \repeat unfold 15 {8-.}
f16->(^\mf e) d8 8 8 f16->( e) d8 8 8
f16->( e) d8 f16->( e) d8 f16->( e) d8 8 8 \breathe
\mark 94
e8-.^\pp \repeat unfold 11 {8-.} \breathe 8-> 8-> 8-> 8->
\tempo "con rumore"
e8->^\ff \repeat unfold 11 {8->} \breathe
e'-> e-> e-> e,-> R1*2
f16->(^\mf e) d8 8 8 f16->( e) d8 8 8
f16->( e) d8 f16->( e) d8 f16->( e) d8 8 8
\breathe
e8-.^\pp \repeat unfold 15 {8-.} 
\mark \default 
f16->(^\mf e) d8 8 8 f16->( e) d8 8 8
f16->( e) d8 f16->( e) d8 f16->( e) d8 8 8
\breathe
e8-.^\pp \repeat unfold 15 {8-.}
8->^\ff \repeat unfold 11 {8->} \breathe
e'-> e-> e-> e,-> \breathe 
\time 3/2 \tempo 4=120
e4->^\f f-> e-> d-> c-> d->
\time 4/4 e16->( d) e8->-. r4 r2
\time 3/2 
e4-> f-> e-> d-> c-> d->
\time 4/4 e16->( d) e8-. r4 r2
\mark \default
\tempo "sempre staccatissimo" 4=132
e8->^\p \repeat unfold 11 {8-.}
e-> e-.e-.e-. e-> \repeat unfold 7 e-.
e-> e-.e-.e-. e16-. e-. e-. e-. e8-. e-.
f4->^\ff 4-> 4-> 8-> 8->
\time 3/2
8-> 8-> 8-> g16->( f e4->) 4-> r2
\time 4/4
f4-> 4-> 4-> 8-> 8->
\time 3/2
8-> 8-> 8-> g16->( f) e4-> 4-> r2
\time 4/4 \tempo "poco ritenuto"
e4---.^\pp f---. e---. d---.
c8-. c-. d-. d-. e4---. e---.
\mark \default
e4---. f---. e---. d8-. d-. 
c-. c-. d4---. e4---. e---.
\tempo "a tempo" \breathe
e8->-.^\pp e-. e-. e16-. e-. e8-. e-. e-.
\breathe 8-.->
8-. 8-. 8-. 16-. e-. 8-. 8-. 8-.
\breathe e-.->
8-. 8-. 8-. 16-. e-. 8-. 8-. 8-.
\breathe e-.->
8-. 8-.  16-. e-. e-. e-. 8-. e-. 4-.
\breathe
d'->^\ff d-> e,-> e->
d'-> d-> e,-> e->
d'-> d-> e,-> e->
d'-> d-> e,-> e->
\mark \default R1*6
\tempo 4=144
e8-.->^\p 8-. fis-. 8-. e-. e-. fis-. 8-.
e8-.-> 8-. fis-. 8-. e-. e-. gis-. 8-.
fis8-.-> 8-. gis-. 8-. fis-. 8-. a-. 8-.
fis8-.-> 8-. gis-. 8-. fis-. 8-. a-. 8-.
\mark \default
e8-.->^\p 8-. fis-. 8-. e-. e-. fis-. 8-.
e8-.-> 8-. fis-. 8-. e-. e-. gis-. 8-.
fis8-.-> 8-. gis-. 8-. fis-. 8-. a-. 8-.
fis8-.-> 8-. gis-. 8-. fis-. 8-. a-. 8-.

gis->-.^\< 8-. fis-. 8-. gis-. 8-. e-. 8-.
gis->-. 8-. fis-. 8-. gis-. 8-. e-. 8-.
gis->-. 8-. e-. 8-. fis-.-> 8-. e-. 8-.
gis->-. 8-. e-. 8-. fis-.-> 8-. <e gis>-. 8-.

<fis a>-.->^\f 8-. <e gis>-. 8-. <fis a>-. 8-. <d fis>-. 8-.
<fis a>-.-> 8-. <e gis>-. 8-. <fis a>-.-> 8-. <d fis>-. 8-.
\mark \default
<fis a>-.-> 8-. <e gis>-. 8-. <d fis>-.-> 8-. <e gis>-. 8-.
<fis a>-.-> 8-. <e gis>-. 8-. <fis a>->^\< 8-> <gis b>-> 8->
\tempo "subito molto stentato"
< a c>4->^\ff 4-> 4-> 4->
\time 3/2
4.->(^\< \tempo "rit." <b d>16->\!  <a c>->) \tempo "a tempo subito" <g b>-> <f a>-> <g b>8-> r4 r2
\time 4/4 \tempo "come prima"
< a c>4->^\ff 4-> 4-> 4->
\time 3/2
4.->^\< \tempo "rit." <b d>16->\!( <a c>->) \tempo "a tempo subito" <g b>->( <f a>->) <g b>8-> r4 r2
\time 4/4 \tempo "sfrenato"
<a c>4->^\f 4-> 4-> 4-> 4.->
<g b>16->( <f a>->) <g b>4-> 4->
<a c>4-> 4-> 4-> 4-> 
4.-> <g b>16->( <f a>->) <g b>4-> 4->
\mark \default
<a c>4.-> <g b>16->( <f a>->) <g b>4-> 4->
<a c>4.-> <g b>16->( <f a>->) <g b>4-> 4->
<a c>4.-> <g b>16->( <f a>->) <g b>4-> 4->
<a c>4.-> <g b>16->( <f a>->) <g b>4-> 4->
\tempo "selvaggio"
<a c>4->^\ff <g b>-> <f a>-> <g b>->
<a c>4-> <g b>-> <f a>-> <g b>->
<a c>4-> <g b>-> <f a>-> <g b>->^\<
<a c>4-> <g b>-> <a c>-> <g d'>->
\breathe
\set Score.caesuraTypeTransform =
    #(at-bar-line-substitute-caesura-type
      '((scripts . (fermata))))
    \caesura
\tempo "scatenato" 4=160
\slashedGrace <g b>8(<a cis>2)^\fff \breathe
\slashedGrace <g b>8(<a cis>2) \breathe
\slashedGrace <g b>8(^"accel....." <a cis>2) \breathe
\slashedGrace <g b>8(<a cis>2) \breathe
\mark \default
\slashedGrace <g b>8(<a cis>2) \breathe
\slashedGrace <g b>8(<a cis>2) \breathe
\slashedGrace <g b>8(<a cis>2) \breathe
\slashedGrace <g b>8(<a cis>2) \breathe \caesura
\tempo "a tempo"
R1*4
\time 2/4 r4 4->-.^\fff^"urlante."\fine

}

intab_lyr = \lyricmode {
  In __ ta -- ber -- na quan -- do su -- mus,
  non __ cu -- ra -- mus quid __ sit hu -- mus,
  sed ad lu -- dum pro -- pe -- ra -- mus,
  cu -- i sem  -- per in -- su -- da -- mus,
  
  Quid a -- ga -- tur in __ ta -- ber -- na,
  U -- bi num -- mus est __ pin -- cer -- na,
  hoc est o -- pus ut que -- ra -- tur,
  si quid lo -- quar, au -- di -- a -- tur,
  hoc est o -- pus ut que -- ra -- tur,
  si quid lo -- quar, au -- di -- a -- tur.
  
  Qui -- dam lu -- dunt, qui -- dam bi -- bunt,
  qui -- dam in -- dis -- cre -- te vi -- vunt.
  Sed in lu -- do qui mo -- ran -- tur,
  ex his qui -- dam de -- nu -- dan -- tur,
  qui -- dam i -- bi ves -- ti -- un -- tur,
  qui -- dam sac -- cis in -- du -- un -- tur.
  
  I -- bi nul -- lus ti -- met mor -- tem,
  sed pro Bac -- cho mit -- tunt sor -- tem.
  I -- bi nul -- lus ti -- met mor -- tem,
  sed pro Bac -- cho mit -- tunt sor -- tem.
  
  Pri -- mo pro num -- ma -- ta vi -- ni,
  ex hac bi -- bunt il -- ber -- ti -- ni;
  
  se -- mel bi -- bunt pro cap -- ti -- vis,
  post hec bi -- bunt ter pro vi -- vis,
  qua -- ter pro Chri -- stia -- nis cunc -- tis,
  quin -- quies pro fi -- de -- li -- bus de func -- tis,
  se -- xi -- es pro so -- ro -- ri -- bus va -- nis,
  sep -- ti -- es pro mi -- li -- ti -- bus sil -- va -- nis.
  Oc -- ti -- es pro fra -- tri -- bus per -- ver -- sis,
  
  no -- ni -- es pro mo -- na -- chis dis -- per -- sis,
  de -- cies pro na -- vi -- gan -- ti -- bus, 
  un -- de -- cies pro dis -- cor -- tan -- ti -- bus,
  duo -- de -- cies pro pe -- ni -- ten -- ti -- bus,
  tre -- de -- cies pro i -- te -- ra -- gen -- ti -- bus.
  
  Tam pro pa -- pa quam pro re -- ge
  bi -- bunt om -- nes si -- ne le -- ge.
  
  Bi -- bit he -- ra, bi -- bit he -- rus,
  bi -- bit mi -- les, bi -- bit cle -- rus,
  bi -- bit il -- le, bi -- bit il -- la,
  bi -- bit ser -- vus cum an -- cil -- la,
  
  bi -- bit ve -- lox, bi -- bit pi -- ger,
  bi -- bit al -- bus, bi -- bit ni -- ger,
  bi -- bit con -- stans, bi -- bit va -- gus,
  bi -- bit ru -- dis, bi -- bit ma -- gus.
  
  Bi -- bit pau -- per et e -- gro -- tus,
  bi -- bit e -- xul et ig -- no -- tus,
  bi -- bit pu -- er, bi -- bit ca -- nus,
  bi -- bit pre -- sul et de -- ca -- nus,
  
  bi -- bit so -- ror bi -- bit fra -- ter,
  bi -- bit a -- nus, bi -- bit ma -- ter,
  bi -- bit i -- ste, bi -- bit il -- le,
  
  bi -- bunt cen -- tum, bi -- bunt mil --le.
  Pa -- rum sex -- cen -- te __ num -- ma -- te
  du -- rant, cum im -- mo -- de -- ra -- te
  
  bi -- bunt om -- nes si -- ne me -- ta,
  quam -- vis bi -- bant men -- te __ le -- ta;
  sic nos ro -- dunt om -- nes gen -- tes,
  et sic __ e -- ri -- mus e -- gen -- tes.
  
  Qui nos ro -- dunt con -- fun -- dan -- tur
  et cum ius -- tis non scri -- ban -- tur.
  Io io io io io io io io io!
  
}

intab = \new Staff \with {instrumentName="Bass"
  shortInstrumentName ="B."} <<
  \hommes_style
  \intab_mus
  \addlyrics \intab_lyr
>>

circa_mus = \relative c{
  \set Score.currentBarNumber = #1180
  \mark 118
  \time 6/4 \tempo 4=132
  \key g \major
  \repeat volta 3 {
    R1.*4
    \time 3/2 R1.
    \time 5/4 r1 r4
    \time 7/4 r2. r1
    \time 6/4
    << \new Voice = "one" {\voiceOne e2\(^\mp fis4^\< g2 fis4 g2 a4 g2.\!\)\breathe 
       e2\( fis4^\< g2 fis4 \mark \default g4( a) b g2.\)\!}
       \new Voice = "two" {\voiceTwo e2 4 2 4 2 b4 e2. e2 4 2 4 2 a,4 e'2.}
       \new Lyrics \lyricsto "one" {"1.Cir" -- ca me -- a pec -- to -- ra mul -- ta sunt sus -- pi -- ri -- a.}
       \new Lyrics \lyricsto "one" {"2.Tu" -- i lu -- cent o -- cu -- li sic -- ut so -- lis ra -- di -- i.}
       \new Lyrics \lyricsto "one" {"(f)3.Vel" -- let de -- us, vel -- lent dii, quod men -- te pro -- po -- su -- i.}
    >> \oneVoice \breathe
    \time 2/2 \tempo "ancora più mosso"
    R1*4 \break 
    <a, d>8-.^\f^"brioso" <c e>-. <d fis>4-- <a d>8-. <c e>-. <d fis>4--
    <a d>8-. <c e>-. <d fis>-. 8-. <a d>8-. <c e>-. <d fis>4->
    R1*3 \mark \default R1*3
  }
}

circa_lyr = \lyricmode {
  Man -- da liet, man -- da liet, min ge -- sel -- le chu -- met niet!
}

circa = \new Staff \with {instrumentName="Bass"
  shortInstrumentName ="B."} <<
  \hommes_style
  \circa_mus
  \addlyrics \circa_lyr
>>

sip_mus = \relative c {
 \time 2/4 \tempo "allegro buffo" 4=160
 \key a \major
  \set Score.currentBarNumber = #1203
 r4 <b d fis>->\(\fermata^\f 8-.\) 8-. 8-. <a cis e>-.
 <b d fis>-. 8-. 8-. \breathe 8-. 8-. 8-. 8-. <a cis e>-.
 <b d fis>-. 8-. 4-- \breathe R2*2 \mark 121 R2*4
 r4\fermata \caesura
 <b d fis>->\(^\pp 8-.\) 8-. 8-. <a cis e>-.
 <b d fis>-. 8-. 8-. \breathe 8-. 8-. 8-. 8-. <a cis e>-.
 <b d fis>-. 8-. 4--
 R2 \mark \default R2*5
 r4\fermata \caesura
 <d fis a>->\(^\f 8-.\) 8-. <cis e gis>-. <d fis a>-.
 \grace {gis16( a} <cis, e gis>8->)( <b d fis>)-. 4-- 
 \breathe
 
 a'8^\f\(^"Solo comic exag." b16( cis) b8 a b gis 
 fis4^\fp->~\mark \default 2~4\)\fermata^\> 
 \breathe
 
 <d fis a>--\(^\pp^"Tutti" 8-.\) 8-. <cis e gis>-. <d fis a>-.
 \grace {gis16( a} <cis, e gis>8->)( <b d fis>)-. 4--
 \breathe

  a'8^\p\(^"Solo" b16( cis) b8 a b gis 
 fis4^\sf->~2~4\) 
 \breathe

  <d fis a>->^\f^"Tutti" 8-. 8-. <cis e gis>-. <d fis a>-.
 \grace {gis16( a} <cis, e gis>8->) <b d fis>-. 8-.
 \breathe
\override Glissando.style = #'zigzag

<d fis a>-.^\pp \mark \default 8-. 8-. <cis e gis>-. <d fis a>-.
 \grace {gis16( a} <cis, e gis>8->) <b d fis>-. 8-. 
fis''-.--^\p\noBeam^"Solo"
b,,-. d-. fis-. a-. \grace {gis16( a} gis8->) fis-. 8-. 
fis'-. b,,-. d-. fis-. a-. \grace {gis16( a} gis8->) fis-. 8-.
<b d fis>^\f->-.\noBeam^"Tutti"
b,-.-> d-.-> fis-.-> a-.-> \grace {gis16( a} gis8->) fis-.-> 8-.->
<b d fis> b,-.-> d-.-> fis-.-> a-.-> \grace {gis16( a} gis8->) fis-.->
8->^\ff <b d fis>->\fermata^"lunga"\glissando
\tempo "allegro molto" \mark \default
\repeat unfold 3 <b, d fis>-.-> <a cis e>-.->
\repeat unfold 7 <b d fis>-.-> <a cis e>-.->
<b d fis>-.-> 8-.-> 4--->
R2*5 \mark \default R2 \fine
 }

sip_lyr = \lyricmode {
Si pu -- er cum pu -- el -- lu -- la mo -- ra -- re -- tur in cel -- lu -- la.
Si pu -- er cum pu -- el -- lu -- la mo -- ra -- re -- tur in cel -- lu -- la.

A -- mo -- re sus-- cres -- cen -- te,
pa -- ri -- ter e me -- di -- o. __
A -- mo -- re sus-- cres -- cen -- te,
pa -- ri -- ter e me -- di -- o __

a -- vul -- so pro -- cul te -- di -- o,
a -- vul -- so pro -- cul te -- di -- o,

fit lu -- dus in -- ef -- fa -- bi -- lis 
mem -- bris, la -- cer -- tis, la -- bi -- is,
fit lu -- dus in -- ef -- fa -- bi -- lis 
mem -- bris, la -- cer -- tis, la -- bi -- is,

si pu -- er cum pu -- el -- lu -- la mo -- ra -- re -- tur in cel -- lu -- la.
}


sip = \new Staff \with {instrumentName="Bass"
  shortInstrumentName ="B."} <<
  \hommes_style
  \sip_mus
  \addlyrics \sip_lyr
>>


veni_musa = \relative c {
  \time 4/4 \tempo allegro 4=160
  \set Score.currentBarNumber = #1261
  R1*3
  r4 r8 d->(^\p 8) c-. d-. d-.
  e-.^\< d-. e-. fis-. g-. a-.\! c4->\breathe
  R1
  r4 r8 d,->(^\mp 8) c-. d-. d-.
  e-.^\< d-. e-. fis-. g-. a-.\! c8-> r
  R1 \mark 127 R1
  r4 r8 e,->(^\mf 8) d-.-> e-.-> fis-.->
  e-.-> d-.-> e-.->^\< fis-.-> g-.-> a-.->\! c4->
  \time 3/4
  r4 r8 a4->^\f g8-.-> r4 r8 a4-> g8-.->
  \time 4/4
  r8 c4-> a8-> g-> \breathe c->^\< a-> g->
  \time 2/4
  c-> a-> c-> g-> c-> a-> c-> g-> c-> a-> c-> g->\!
  \time 4/4 \key f \major
  bes4--^\mf 4-- 4-- 4-- \mark \default 
  bes8->( c) bes( a) g2-> \breathe
  bes4-- 4-- 4-- 4-- 
  bes8->( c) bes( a) g2-> \breathe
  bes4-- 4-- 4-- 4-- 
  bes8->( c) bes( a) g2-> \breathe
  bes4-- 4-- 4-- 4-- 
  bes8->( c) bes( a) g2-> \breathe
  bes4-- 4-- 4-- 4-- 
  bes8->( c) bes( a) g2-> \breathe
  bes4-- 4-- 4-- 4-- \mark \default
  bes8->( c) bes( a) g2-> \breathe
  bes8->( c) bes( a) g4-- a--
  bes-> a-> g2-> \breathe
  bes8->( c bes a bes4) c-> \breathe
  g->^\< a-> bes-> c->
  d4.->(^\ff c8-> d4.-> c8-> d4.-> c8-> d4.->)
  c8->\( d1->~\after 4.^\< \after 2..\!1\) \breathe \fine
  }
veni_lyra = \lyricmode {
  Ve -- ni, ve -- ni, ve -- ni, ve -- ni, ve -- ni -- as,
  ve -- ni, ve -- ni, ve -- ni, ve -- ni, ve -- ni -- as,
  ne __ me -- mo -- ri, ne me -- mo -- ri fa -- ci -- as,
  hyr -- ce, hyr -- ce,
  
  na -- za -- za, na -- za -- za
  tri -- li -- ri -- vos,
  tri -- li -- ri -- vos,
  tri -- li -- ri -- vos!
  
  Pulch -- ra ti -- bi fa -- ci -- es,
  o -- cu -- lo -- rum a -- ci -- es,
  ca -- pil -- lo -- rum se -- ri -- es,
  o quam cla -- ra spe -- ci -- es!
  Ro -- sa ru -- bi -- cun -- di -- or,
  li -- li -- o can -- di -- di -- or,
  
  om -- ni -- bus for -- mo -- si -- or,
  sem -- per, sem -- per in te glo -- ri -- or! __
}

veni_musb = \relative c' {
  \time 4/4
  R1*12
  \time 3/4 R2.*2
  \time 4/4 R1
  \time 2/4 R2*3
  \time 4/4 \key f \major 
  R1 r2 r8 c->-.^\f 8->-. 8->-.
  R1 r2 r8 c->-.^\f 8->-. 8->-.
  R1 r2 r8 c->-.^\f 8->-. 8->-.
  R1 r2 r8 c->-.^\f 8->-. 8->-.
  R1 r2 r8 c->-.^\f 8->-. 8->-.
  R1 r2 r8 c->-.^\f 8->-. 8->-.
  R1 r2 r8 c->-.^\f 8->-. 8->-. R1*2
  r8 c->( d4.) c8->( d4~8) 
  c->( d4.) c8->( d4)
  r8 d-.-> d-.-> d-.->
  r8 d-.-> d-.-> d-.->
  r8 d-.-> d-.-> d-.->^\<
  r8 d-.-> d-.-> d-.->\! \breathe \fine
}
veni_lyrb = \lyricmode {
  na -- za -- za, na -- za -- za,
  na -- za -- za, na -- za -- za,
  na -- za -- za, na -- za -- za,
  na -- za -- za.
  Ah __ ah __ ah __ ah __
  na -- za -- za, na -- za -- za,
  na -- za -- za, na -- za -- za.
}

veni = \new ChoirStaff <<
\new Staff \with {instrumentName="Bass 2"
  shortInstrumentName ="B2"} <<
  \hommes_style
  \key g \major
  \veni_musa
  \addlyrics \veni_lyra
>>
\new Staff \with {instrumentName="Bass 1"
  shortInstrumentName ="B1"} <<
  \hommes_style
  \key g \major
  \veni_musb
  \addlyrics \veni_lyrb
>>
>>


tempus_mus = \relative c {
  \time 4/4
  \tempo "allegro molto" 4 = 144
  \set Score.currentBarNumber = #1317

  <d a'>8-.->^\f 8-. 8-. <e gis>-. <d a'>4-> 4-> \breathe
  \time 3/4
  d8^\p-.-> 8-. 8-.[ cis->] d-. 8-. \breathe
  \time 4/4
  <b fis'>4---.^\mf 4---. 4---. 8---. \breathe 8-. \mark 132 
  8.-> <cis e>16-. d8 \breathe <b fis'>-. 8.-> <cis e>16-. d4-.

  <d a'>8-.->^\f 8-. 8-. <e gis>-. <d a'>4-> 4-> \breathe
  \time 3/4
  d8^\p-.-> 8-. 8-.[ cis->] d-. 8-. \breathe
  \time 4/4
  <b fis'>4---.^\mf 4---. 4---. 8---. \breathe 8-. 
  8.-> <cis e>16-. d8 \breathe <b fis'>-. 8.-> <cis e>16-. d4-.
  \bar "||"
  \tempo "più lento" 4=120 R1*4 \time 5/4 r2 r2 r8
  <b'd>->^\f 
  \mark \default \time 3/2 \tempo 4=144
  <a cis>8.-> 16 8 \breathe 
  <b d>-> <a cis>8.-> 16 8 \breathe
  <b d>-> <a cis>8.-> 16-> 4-> \breathe
  \time 4/4 \tempo "allegro molto" R1 \time 3/4 R2.
  \time 4/4 R1*3 \time 3/4 R2. \time 4/4 R1*2 \tempo "come prima" R1
  \mark \default
  R1*3 \time 5/4 r2. r2 \time 3/2 \tempo 4=144 R1.
  \tempo "allegro molto"
  \time 4/4
  <d, a'>8->^\mf 8 8 <e gis> <d a'>4-> 4-> \breathe
  \time 3/4
  d8^\p-> 8 8[ cis->] d d \breathe
  \time 4/4
  <b fis'>4->^\mf 4-> 4-> 8-> \breathe 8-> 
  8.-> <cis e>16 d8 \breathe <b fis'>8-> 8.-> <cis e>16 d4

  <d a'>8->^\mf 8 8 <e gis> <d a'>4-> 4-> \breathe
  \time 3/4 \mark \default
  d8^\p-> 8 8[ cis->] d d \breathe
  \time 4/4
  <b fis'>4->^\mp 4-> 4-> 8-> \breathe 8-> 
  8.-> <cis e>16 d8 \breathe <b fis'>-> 8.-> <cis e>16 d4
  \tempo "come prima" R1*4 
  \time 5/4 r2 r2 r8
  <b'd>->^\f 
  \time 3/2 \tempo 4=144
  <a cis>8.-> 16 8 \breathe 
  <b d>-> <a cis>8.-> 16 8 \breathe
  <b d>-> <a cis>8.-> 16-> 4-> \breathe
  \time 4/4 R1 \mark \default \time 3/4 R2. \time 4/4 R1*3
  \time 3/4 R2. \time 4/4 R1*2 
  \tempo "come prima" R1*3 \mark \default R1 
  \time 5/4 r2. r2 \time 3/2 \tempo 4=144 R1.
  \tempo "allegro molto"
  \time 4/4
  <d, a'>8->^\ff 8-> 8-> <e gis>-> <d a'>4-> 4-> \breathe
  \time 3/4
  d8^\p-> 8 8[ cis->] d d \breathe
  \time 4/4
  <b fis'>4->^\f 4-> 4-> 8-> \breathe 8-> 
  8.-> <cis e>16 d8 \breathe <b fis'>8-> 8.-> <cis e>16 d4

  <d a'>8->^\ff 8-> 8-> <e gis>-> <d a'>4-> 4-> \breathe
  \time 3/4
  d8^\p-> 8 8[ cis->] d d \breathe
  \time 4/4
  <b fis'>4->^\f 4-> 4-> 8-> \breathe 8-> \mark \default
  8.-> <cis e>16 d8 \breathe <b fis'>8-> 8.-> <cis e>16 d4
  \tempo "più lento"
  e4-> fis -> e2-> \breathe
  e8-> e-> fis-> 8-> e2-> \breathe
  e8-> g g fis e-> g g fis
  e-> e-> fis-> d-> e2-> \breathe
  \time 5/4 \tempo "accel."
  e8-> fis8 8-> e e-> g g-> fis e \breathe
  <b'd>->^\ff 
  \time 3/2
  <a cis>8.-> 16-> 8-> \breathe 
  <b d>-> <a cis>8.-> 16-> 8-> \breathe
  <b d>-> <a cis>8.-> 16-> 4-> \fine
  }

tempus_lyr = \lyricmode {
  Tem -- pus est io -- cun -- dum,
  Tem -- pus est io -- cun -- dum,
  o, o, o, o, o, vir -- gi -- nes, o vir -- gi -- nes,
  mo -- do con -- gau -- de -- te,
  mo -- do con -- gau -- de -- te,
  vos, vos, vos, vos, vos iu -- ve -- nes, vos iu -- ve -- nes.
  quo per -- e -- o, quo per -- e -- o, quo per -- e -- o!
  
  Tem -- po -- re bru -- ma -- li,
  tem -- po -- re bru -- ma -- li
  vir, vir, vir, vir, vir pa -- ti -- ens, vir pa -- ti -- ens,
  a -- ni -- mo ver -- na -- li,
  a -- ni -- mo ver -- na -- li,
  la, la, la, la, la -- sci -- vi --  ens, la -- sci -- vi -- ens.
  quo per -- e -- o, quo per -- e -- o, quo per -- e -- o!
  
  Ve -- ni, do -- mi -- cel -- la,
  ve -- ni, do -- mi -- cel -- la,
  cum, cum, cum, cum, cum gau -- di -- o, cum gau -- di -- o,
  ve -- ni, ve -- ni, pulch -- ra, 
  ve -- ni, ve -- ni, pulch -- ra, 
  iam, iam, iam, iam, iam pe -- re -- o, iam pe -- re -- o.
  
  Oh, oh, oh, to -- tus flo -- re -- o,
  iam a -- mo -- re vir -- gi -- na -- li
  to -- tus ar -- de -- o,
  no -- vus, no -- vus, no -- vus a -- mor est,
  quo per -- e -- o, quo per -- e -- o, quo per -- e -- o!
}

tempus = \new Staff \with {instrumentName="Bass"
  shortInstrumentName ="B."} <<
  \hommes_style
  \key d \major
  \tempus_mus
  \addlyrics \tempus_lyr
>>


blan_mus = \relative c' {
  \set Score.currentBarNumber = #1391
  \time 4/2 \tempo 2=72
  \key g \major
  <b d>2->^\ff <g b>-> <fis g>-> <e g>->
  <fis a>2.-> <g c>4-> <fis a>1->\fermata \breathe
  <b d>2-> <g b>-> <fis g>-> <e g>->
  <fis a>1-> <fis a>1->\fermata \breathe
  <g c>2-> <c e>-> <a e>-> <fis b>->
  <g c>2.-> <fis b>4-> <g c>1->\fermata \breathe
  <g c>2-> <c e>-> <a e>-> <fis b>->
  <g c>1-> <g c>1->\fermata \breathe
  <g c>2-> <a d>-> <b e>-> <a d>-> \mark 140
  <g c>-> <fis b>-> <g c>1-> \fermata \breathe
  <g c>2-> <a d>-> <b e>-> <a d>->
  <g c>1-> <g c>1-> \fermata \breathe
  \time 6/2 \tempo 2=52
  <d' g>^\ff->~4 <cis fis>-> <b e>-> <a d>->
  <g cis>-> <a d>-> <b e>2-> \breathe
  <cis fis>1->~4 <b e>-> <a d>-> <g cis>-> <fis b>->
  <g cis>-> <a d>2-> \breathe
  \time 4/2
  r4 <b d>2-> <a cis>4-> r4 <b d>2-> <a cis>4->
  \time 6/2
  r4 <b d>2-> <a cis>4-> r \tempo "rit." <b d>2->^\< <a cis>->
  <b d>-> <a e'>4->\!^"ten." \fine
  
}

blan_lyr = \lyricmode {
  A -- ve for -- mo -- sis -- si -- ma,
  gem -- ma pre -- ti -- o -- sa,
  a -- ve de -- cus vir -- gi -- num,
  vir -- go glo -- ri -- o -- sa,
  a -- ve mun  -- di lu -- mi -- nar,
  a -- ve mun -- di ro -- sa,
  Blan -- zi -- flor et He -- le -- na,
  Blan -- zi -- flor et He -- le -- na,
  Ve -- nus, Ve -- nus, Ve -- nus, ge -- ne -- ro -- sa!
}

blan = \new Staff \with {instrumentName="Bass"
  shortInstrumentName ="B."} <<
  \hommes_style
  \blan_mus
  \addlyrics \blan_lyr
>>


\book {
\bookpart {
\header {subtitle = "Fortuna Imperatrix Mundi"}
\markup {\fontsize #2 \bold {Qu -> kv, se -> ze, ce -> tse}}
\score {\header { piece = \markup \fontsize #2 \bold "1. O Fortuna"} \fortu_bass  }
\score {\header { piece = \markup \fontsize #2 \bold "2. Fortune plango vulnera"} \vulne  }
  }
\bookpart {
\header { title = "I Primo Vere"}
\score {\header { piece = \markup \fontsize #2 \bold "3. Veri leta facies"} \veri }
% \score {\header { piece = \markup \fontsize #2 \bold "4. Omnia sol temperat" } \omnia }
\markup {\fontsize #2 \bold {4. Omnia sol temperat}}
\score {\header { piece = \markup \fontsize #2 \bold "5. Ecce gratum"} \ecce }
}
\bookpart {
\header { title = "Uf dem Anger" }
\markup {\fontsize #2 \bold {6. Tanz}}
\score {\header { piece = \markup \fontsize #2 \bold "7. Floret Silva" } \flore }
\score {\header { piece = \markup \fontsize #2 \bold "8. Chramer, gip die varwe mir"} \chrame }
\markup {\fontsize #2 \bold {9.a Reie}}
\score {\header { piece = \markup \fontsize #2 \bold "9.b Swaz hie gat umbe" } \swaz }
\score {\header { piece = \markup \fontsize #2 \bold "9.c Chume, chum, geselle min"} \chume }
\markup {\fontsize #2 \bold {9.d Swaz hie gat umbe: Same as 9.b, offset +85 measures}}
\score {\header { piece = \markup \fontsize #2 \bold "10. Were diu werlt alle min"} \were }
}

\bookpart {
\header { title = "II In Taberna" }
% \score {\header { piece = \markup \fontsize #2 \bold "11. Estuans interius" } \dummy}
\markup {\fontsize #2 \bold {11. Estuans interius}}
\score {\header { piece = \markup \fontsize #2 \bold "12. Olim lacus colueram" } \olim}
\score {\header { piece = \markup \fontsize #2 \bold "13. Ego sum abbas" } \ego}
\score {\header { piece = \markup \fontsize #2 \bold "14. In taberna quando sumus"} \intab}
}

\bookpart {
\header { title = "III Cour d'amours" }
\markup {\fontsize #2 \bold {15. Amor volat undique}}
\markup {\fontsize #2 \bold {16. Dies, nox et omnia}}
\markup {\fontsize #2 \bold {17. Stetit puella}}
% \score {\header { piece = \markup \fontsize #2 \bold "15. Amor volat undique" } \dummy}
% \score {\header { piece = \markup \fontsize #2 \bold "16. Dies, nox et omnia" } \dummy}
% \score {\header { piece = \markup \fontsize #2 \bold "17. Stetit puella" } \dummy}
\score {\header { piece = \markup \fontsize #2 \bold "18. Circa mea pectora" } \circa}
\score {\header { piece = \markup \fontsize #2 \bold "19. Si puer cum puellula" } \sip}
%\markup {\fontsize #2 \bold {19. Si puer cum puellula}}
\score {
  \layout {
  \context {
    \Staff
    \RemoveAllEmptyStaves
  }
}
  \header { piece = \markup \fontsize #2 \bold "20. Veni, veni, venias" } \veni}
% \score {\header { piece = \markup \fontsize #2 \bold "21. In trutina" } \dummy}
\markup {\fontsize #2 \bold {21. In trutina}}
\score {\header { piece = \markup \fontsize #2 \bold "22. Tempus et iocundum" } \tempus}
% \score {\header { piece = \markup \fontsize #2 \bold "23. Dulcissime" } \dummy}
\markup {\fontsize #2 \bold {23. Dulcissime}}
}

\bookpart {
  \header { title = "Blanziflor et Helena" }
\score {\header { piece = \markup \fontsize #2 \bold "24. Ave formosissima" } \blan}
\markup \fontsize #4 \bold "                               Fortuna Imperatrix Mundi"
\score {\header { piece = \markup \fontsize #2 \bold "25. O Fortuna" } \fortu_bass}
%\markup \fontsize #2 \bold "25. O Fortuna -> 1. O Fortuna"}
}
%\markup {\fontsize #2 \bold {25. O Fortuna}}
%\score {\header { piece = \markup \fontsize #2 \bold "24. Ave formosissima" } \dummy}
}

\book {\bookOutputSuffix "1-Fortuna" \score {\unfoldRepeats << \fortu_bass >> \midi {}}}
\book {\bookOutputSuffix "2-Fortune" \score {\unfoldRepeats << \vulne>> \midi {}}}
\book {\bookOutputSuffix "3-veri" \score {\unfoldRepeats << \veri>> \midi {}}}
\book {\bookOutputSuffix "4-omnia" \score {\unfoldRepeats << \omnia>> \midi {}}}
\book {\bookOutputSuffix "5-ecce" \score {\unfoldRepeats << \ecce>> \midi {}}}
\book {\bookOutputSuffix "7-floret" \score {\unfoldRepeats << \flore>> \midi {}}}
\book {\bookOutputSuffix "8-chramer" \score {\unfoldRepeats << \chrame>> \midi {}}}
\book {\bookOutputSuffix "9b-swaz" \score {\unfoldRepeats << \swaz>> \midi {}}}
\book {\bookOutputSuffix "9c-chume" \score {\unfoldRepeats << \chume>> \midi {}}}
\book {\bookOutputSuffix "10-were" \score {\unfoldRepeats << \were>> \midi {}}}
\book {\bookOutputSuffix "12-olim" \score {\unfoldRepeats << \olim>> \midi {}}}
\book {\bookOutputSuffix "13-ego" \score {\unfoldRepeats << \ego>> \midi {}}}
\book {\bookOutputSuffix "14-intab" \score {\unfoldRepeats << \intab>> \midi {}}}
\book {\bookOutputSuffix "18-circa" \score {\unfoldRepeats << \circa>> \midi {}}}
\book {\bookOutputSuffix "19-sip" \score {\unfoldRepeats << \sip>> \midi {}}}
\book {\bookOutputSuffix "20-veni" \score {\unfoldRepeats << \veni>> \midi {}}}
\book {\bookOutputSuffix "22-tempus" \score {\unfoldRepeats << \tempus>> \midi {}}}
\book {\bookOutputSuffix "24-blanziflor" \score {\unfoldRepeats << \blan>> \midi {}}}


%\bookpart {
%  \header { title = "Fortuna Imperatrix Mundi" }
%\markup {\fontsize #2 \bold {25. O Fortuna}}
%}

  
 % \bookpart {
 %   \header { subtitle = "Deuxième partie" }
 %   \score {
 %     \header { piece = "Ecce gratum" }
 %     \fortu_bass% musique
 %   }
    % etc.
 % }
%}

%{
convert-ly.py (GNU LilyPond) 2.24.4  convert-ly.py: Processing `'...
Applying conversion: 2.23.1, 2.23.2, 2.23.3, 2.23.4, 2.23.5, 2.23.6,
2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11, 2.23.12,  Not smart enough
to convert music following \fine.  Warning: \fine no longer enforces
the end of the music.  If your piece has music following \fine that
you want to exclude when it is unfolded, use \volta to exclude it.
Please refer to the manual for details, and update manually. 2.23.13,
2.23.14, 2.24.0
%}
