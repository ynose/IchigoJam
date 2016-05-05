



===============================
    |        |       |      |
    O        |       |      O
  <   >      |       O    < A >
             |      <A>   |   |
             |            |---|
             |
             |
             |
             |
             O
           <   >

    A        A
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





'------------------------------
'X,Y -> ADXL345
'L,T -> Crane Left(2..29), Top(6..16)
'M,U -> Crane Left, Top old
'C   -> Crane Open(0), Close(1)
'O   -> Catched Object CHR$()
'A   -> Target Object CHR$()
'B   -> Target Object Left RND(29-2)+2
'S   -> Score
'R   -> Time

1 'CRANE GAME
2 CLS:CLV:CLT
3 FOR I=0 TO 31
4 LC I,5:?"ë":LC I,21:?"=":LC I,3:?"è"
5 NEXT
6 LC 28,21:?"çåé"

' Initialize ADXL345
10 POKE #700,#31,#00:IF I2CW(#53,#700,1,#701,1)?"E"
11 POKE #700,#2D,#08:IF I2CW(#53,#700,1,#701,1)?"E"

' Initialize Game
' Target Object
20 A=255:B=RND(26-2)+2

' Mainloop 
' Read ADXL345
100 POKE #700,#32:IF I2CR(#53,#700,1,#701,6)?"E"
101 IF T=6 X=PEEK(#702)<<8+PEEK(#701):X=X+55:L=L+X/10
102 IF T>5 Y=PEEK(#704)<<8+PEEK(#703):Y=Y+93:T=T+Y/10*-1

' Read Button
103 C=IN(1)

'Crane Adjust Left Top 
110 IF L<2 L=2
111 IF L>29 L=29
112 IF T<6 T=6
113 IF T>19 T=19
114 IF O=A B=L

'Target Object
115 IF T=19&&L=B&&C=0 O=A:B=L
116 IF C=1 O=0
117 IF O=0 LC B,20:?CHR$(A)

'Crane Move
120 FOR I=6 TO 19
121 IF I<T LC L,I:?"|"
122 IF I>T+1 LC L,I:?" "
123 NEXT
130 IF L<>M||T<>U LC M,U:?" ":LC M-2,U+1:?"     "
131 LC L,T:?"O"
132 IF C=1 THEN LC L-2,T+1:?"< ";CHR$(O);" >" ELSE LC L-2,T+1:?" <";CHR$(O);"> "
133 M=L:U=T

'Score
300 LC0,0:?"√›Ω≥:"
310 IF SCR(29,20)<>0 S=S+1:LC4+S,0:?CHR$(255):WAIT 30:LC 29,20:?CHR$(0):GOTO 20

'Time
400 R=TICK()/120
410 LC 32-R,3:?CHR$(0)
420 IF 32-R=0 LC12,12:?"GAME OVER":END


999 WAIT1:GOTO 100