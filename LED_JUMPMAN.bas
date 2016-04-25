' R Button -> Walk
' L Button -> Jump

1 'LED_JUMPMAN
2 CLS:CLV
3 U=200:D=300:O=700:'Subroutine
4 L=0:R=0:C=0

'Main loop
10  K=IN(1):IF K<>L L=K
20  K=IN(4):IF K<>R R=K

'L R button Push
90 X=1 :Y=19:IF L=0 THEN       GSB D ELSE GSB U
91 X=26:Y=19:IF R=0 THEN C=C+1:GSB D ELSE GSB U

' Walk & Jump
92 IF L=1 AND R=0 LC C,15:?" ˚ ":LC C,14:?"   "
93 IF L=0 AND R=1 LC C,14:?" ˚ ":LC C,15:?"   "
94 IF L=1 AND R=1 LC C,15:?" ˘ ":LC C,14:?"   "

' 4 colors LED On/Off
100 Y=10
110 X=6 :GSB O:OUT1,C=X AND L=0
120 X=11:GSB O:OUT2,C=X AND L=0
130 X=16:GSB O:OUT3,C=X AND L=0
140 X=21:GSB O:OUT4,C=X AND L=0

190 WAIT 5:GOTO 10

'Button Up
200 LC X,Y  :?" áÉã "
210 LC X,Y+1:?" çåé "
220 LC X,Y+2:?"  è  "
230 LC X,Y+3:?"áÉÉÉã"
240 RTN

'Button Down'
300 LC X,Y  :?"     "
310 LC X,Y+1:?" áÉã "
320 LC X,Y+2:?" çåé "
330 LC X,Y+3:?"áÉÉÉã"
390 RTN

' LED Off
500 LC X,Y  :?"    "; 
510 LC X,Y+1:?" Üâ ";
520 LC X,Y+2:?" Öä ";
530 LC X,Y+3:?" áã ";
590 RTN

' LED On
600 LC X,Y  :?" ** "; 
610 LC X,Y+1:?"*Üâ*";
620 LC X,Y+2:?" Öä ";
630 LC X,Y+3:?" áã ";
690 RTN

' LED
700 IF C=X AND L=0 THEN GSB 600 ELSE GSB 500
710 RTN
