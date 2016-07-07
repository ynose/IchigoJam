'01234567890123456789012345678901
'�ݽ�:��                         0
'                                1
'                                2
'��������������������������      3
'                                4
'��������������������������������5
'  �          �       �       �  6
'<   >        �       �       �  7
'             �       �     <   >8
'             �      <�>         9
'             �                  10
'             �                  11
'             �                  12
'             �                  13
'             �                  14
'             �                  15
'           <   >                16
'                                17
'                                18
'                                19
'             �               �  20
'============================���=21
'                                22
'                                23
'01234567890123456789012345678901

'------------------------------
'X,Y -> ADXL345
'L,T -> Crane Left(2..29), Top(6..20)
'M,U -> Crane Left, Top old
'C   -> Crane Open(1), Close(0)
'O   -> Catched Object
'A   -> Target Object CHR$(255)=�
'B   -> Target Object Left Random
'S   -> Score 3=���
'R   -> Time ��

1 '���޷����-

'Initialize Screen
10 CLS:CLV:CLT
20 FOR I=0 TO 31
30 LC I,5:?"�":LC I,21:?"=":LC I,3:?"�"
40 NEXT
50 LC 28,21:?"���"

'Initialize ADXL345(I2C)
60 POKE #700,#31,#00:IF I2CW(#53,#700,1,#701,1)?"E"
70 POKE #700,#2D,#08:IF I2CW(#53,#700,1,#701,1)?"E"

'Initialize Game
'Target Object �
80 A=255:B=RND(26-2)+2

'Mainloop 
'Read ADXL345(Adjust Center X+55,Y+93)
90 POKE #700,#32:IF I2CR(#53,#700,1,#701,6)?"E"
100 IF T=6 X=PEEK(#702)<<8+PEEK(#701):X=X+55:L=L+X/20
110 IF T>5 Y=PEEK(#704)<<8+PEEK(#703):Y=Y+93:T=T+Y/20*-1

'Crane Open Close
120 C=IN(1)

'Crane Adjust Left Top 
130 IF L<2 L=2
140 IF L>29 L=29
150 IF T<6 T=6
160 IF T>19 T=19
170 IF O=A B=L

'Catch & Release Object
180 IF T=19&&L=B&&C=0 O=A:B=L
190 IF C=1 O=0
200 IF O=0 LC B,20:?CHR$(A)

'Crane Move
210 FOR I=6 TO 19
220 LC L,I
230 IF I<T ?"�"
240 IF I>T+1 ?" "
250 NEXT
260 IF L<>M||T<>U LC M,U:?" ":LC M-2,U+1:?"     "
270 LC L,T:?"�"
280 LC L-2,T+1:
290 IF C=1 THEN ?"< ";CHR$(O);" >" ELSE ?" <";CHR$(O);"> "
300 M=L:U=T

'Score & Initialize Game
310 LC0,0:?"�ݽ�:"
320 IF SCR(29,20)<>0 S=S+1:LC 4+S,0:?CHR$(255):WAIT 30:LC 29,20:?CHR$(0):GOTO 80

'Time & GameOver
330 R=TICK()/120
340 LC 32-R,3:?CHR$(0)
350 IF 32-R=0 LC 12,12:?"GAME OVER":END


360 WAIT1:GOTO 90