'01234567890123456789012345678901
'Ãİ½³:ÿÿ                         0
'                                1
'                                2
'      3
'                                4
'‘‘‘‘‘‘‘‘‘‘‘‘‘‘‘‘‘‘‘‘‘‘‘‘‘‘‘‘‘‘‘‘5
'  è          ò       ò       ò  6
'<   >        ò       ò       è  7
'             ò       è     <   >8
'             ò      <ÿ>         9
'             ò                  10
'             ò                  11
'             ò                  12
'             ò                  13
'             ò                  14
'             è                  15
'           <   >                16
'                                17
'                                18
'                                19
'             ÿ               ÿ  20
'============================Œ=21
'                                22
'                                23
'01234567890123456789012345678901

'------------------------------
'X,Y -> ADXL345
'L,T -> Crane Left(2..29), Top(6..20)
'M,U -> Crane Left, Top old
'C   -> Crane Open(1), Close(0)
'O   -> Catched Object
'A   -> Target Object CHR$(255)=ÿ
'B   -> Target Object Left Random
'S   -> Score 3=ÿÿÿ
'R   -> Time 

1 '²ÁºŞ·¬¯Á¬-

'Initialize Screen
2 CLS:CLV:CLT
3 LC0,0:?"Ãİ½³:"
4 FOR I=0 TO 31
5 LC I,5:?"‘":LC I,21:?"=":LC I,3:?""
6 NEXT
7 LC 28,21:?"Œ"

'Initialize ADXL345(I2C)
10 POKE #700,#31,#00:IF I2CW(#53,#700,1,#701,1)?"E"
11 POKE #700,#2D,#08:IF I2CW(#53,#700,1,#701,1)?"E"

'Initialize Game
'Target Object ÿ
20 A=255:B=RND(26-2)+2

'Mainloop 
'Read ADXL345(Adjust Center X+55,Y+93)
100 POKE #700,#32:IF I2CR(#53,#700,1,#701,6)?"E"
101 IF T=6 X=PEEK(#702)<<8+PEEK(#701):X=X+55:L=L+X/10
102 IF T>5 Y=PEEK(#704)<<8+PEEK(#703):Y=Y+93:T=T+Y/10*-1

'Crane Open Close
103 C=IN(1)

'Crane Adjust Left Top 
110 IF L<2 L=2
111 IF L>29 L=29
112 IF T<6 T=6
113 IF T>19 T=19
114 IF O=A B=L

'Catch & Release Object
115 IF T=19&&L=B&&C=0 O=A:B=L
116 IF C=1 O=0
117 IF O=0 LC B,20:?CHR$(A)

'Crane Move
120 FOR I=6 TO 19
121 LC L,I
122 IF I<T ?"ò"
123 IF I>T+1 ?" "
124 NEXT
130 IF L<>M||T<>U LC M,U:?" ":LC M-2,U+1:?"     "
131 LC L,T:?"è"
132 LC L-2,T+1:
133 IF C=1 THEN ?"< ";CHR$(O);" >" ELSE ?" <";CHR$(O);"> "
134 M=L:U=T

'Score & Initialize Game
300 IF SCR(29,20)<>0 S=S+1:LC 4+S,0:?CHR$(255):WAIT 30:LC 29,20:?CHR$(0):GOTO 20

'Time & GameOver
400 R=TICK()/120
410 LC 32-R,3:?CHR$(0)
420 IF 32-R=0 LC 12,12:?"GAME OVER":END


999 WAIT1:GOTO 100