' L, T = BALL Left, Top
' M, U = BALL Left, Top old

1 'MAZE
2 CLS:CLV:CLT

'MAZE
'S=Start, G=Goal, X=Trap
10 ?"S"
11 ?""
12 ?""
13 ?""
14 ?""
15 ?""
16 ?""
17 ?""
18 ?""
19 ?""
20 ?""
21 ?""
22 ?"X"
23 ?""
24 ?""
25 ?""
26 ?""
27 ?""
28 ?""
29 ?""
30 ?""
31 ?""
32 ?""
33 ?"G"

'Scan Start
40 FOR L=0 TO 31
41 FOR T=0 TO 23
42 IF SCR(L,T)="S" M=L:U=T:GOTO 50
43 NEXT
44 NEXT

'Initialize ADXL345(I2C)
50 POKE #700,#31,#00:IF I2CW(#53,#700,1,#701,1)?"E"
51 POKE #700,#2D,#08:IF I2CW(#53,#700,1,#701,1)?"E"

'Mainloop 
'Read ADXL345(Adjust Center X+55,Y+93)
100 POKE #700,#32:IF I2CR(#53,#700,1,#701,6)?"E"
101 X=PEEK(#702)<<8+PEEK(#701):X=X+55:X=X/10
102 Y=PEEK(#704)<<8+PEEK(#703):Y=Y+93:Y=Y/10*-1

'Scan Wall
110 IF L+X<L && SCR(L-1,T)=0 L=L-1:WAIT 60-ABS(X)  ' Left
111 IF L+X>L && SCR(L+1,T)=0 L=L+1:WAIT 60-ABS(X)  ' Right
112 IF T+Y<T && SCR(L,T-1)=0 T=T-1:WAIT 60-ABS(Y)  ' Top
113 IF T+Y>T && SCR(L,T+1)=0 T=T+1:WAIT 60-ABS(Y)  ' Down

'Move BALL
120 IF L<>M||T<>U LC M,U:?" "
121 IF SCR(L,T)="G" LC 12,12:?"GOAL !!":END
122 IF SCR(L,T)="X" LC 12,12:?" NG !! ":END
123 LC L,T:?"O"
124 M=L:U=T

999 WAIT 1:GOTO 100