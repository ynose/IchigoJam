'X,Y,V ... AXIS
'L,T,M,U ... Cursor
'O ... Old Ink (ASC)
'N ... New Ink (ASC)
'P ... Palette

1 'IchigoJam Paint for JamCon

10 CLS:CLV

'Setting JamCon
20 V=50
30 OUT3,-1:OUT4,-1

'Palette
40 LET [0],#20,#01,#02,#E4,#E5,#E7,#E8,#E9,#EE,#FB,#FF
50 LC 10,22:?"";
60 FOR I=1 TO 10:LC 10+I,22:?CHR$([I]);:NEXT

'Ink
70 P=-1:O=[0]

'Mainloop 
'Read AXIS
100 X=ANA(8)-512:L=L+(X/V)*-1
110 Y=ANA(7)-512:T=T+(Y/V)
'111 LC 15,22:?"X:";X;" Y:";Y;

'Limit Cursor
130 IF L<0 L=0
140 IF L>31 L=31
150 IF T<0 T=0
160 IF T>21 T=21

'Change Ink
170 GOSUB 600

'Move Cursor
200 IF L<>M||T<>U LC M,U:M=L:U=T:IF IN(1)=0 ?CHR$(N); ELSE ?CHR$(O);:O=SCR(L,T)

'Paint Ink or Cursor
300 LC L,T:IF IN(1)=0 ?CHR$(N);:O=N ELSE ?"";

500 GOTO 100

'Ink Selector
600 A=ANA(2)
610 Z=(A*10/(1023-20))
620 IF P=Z RTN
630 P=Z:N=[P]
640 LC 10,23:?"           ";
650 LC 10+P,23:?"";
660 PWM2,P*20
670 RTN
