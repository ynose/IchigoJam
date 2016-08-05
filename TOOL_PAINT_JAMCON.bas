'X,Y,V ... AXIS
'L,T,M,U ... Cursor
'O ... Old Ink (ASC)
'N ... New Ink (ASC)
'P ... Palette

1 'IchigoJam Paint for JamCon

10 CLS:CLV

'Setting JamCon
20 V=30
30 OUT3,-1:OUT4,-1

'Palette
40 LET [0],32,64,65,66,67,68,69,70,71,72,255
50 FOR I=0 TO 10:LC I,22:?CHR$([I]);:NEXT

'Ink
60 O=[0]

'Mainloop 
'Read AXIS
100 X=ANA(8)-512:L=L+X/V
110 Y=ANA(7)-512:T=T+Y/V*-1

'Limit Cursor
130 IF L<0 L=0
140 IF L>31 L=31
150 IF T<0 T=0
160 IF T>21 T=21

'Change Ink
170 GOSUB 600

'Move Cursor
200 IF L<>M||T<>U LC M,U:M=L:U=T:IF IN(1)=0 ?CHR$(N); ELSE ?CHR$(O);
210 O=SCR(L,T)

'Paint Ink or Cursor
300 LC L,T:IF IN(1)=0 ?CHR$(N);:O=N ELSE ?"X"

500 GOTO 100

'Ink Selector
600 A=ANA(2)
610 V=(A*10/(1023-10))
620 IF P=V RTN
630 P=V:N=[P]
640 FOR I=0 TO 10:LV I,23:?" ";:NEXT
650 LC P,23:?"^";
660 RTN
