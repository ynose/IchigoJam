'A,B BUG X,Y
'D   BUG Direction
'    012
'    7 3
'    654
'L,T FINDER X,Y
'S   Score

'1 '—º“∂ﬁ»
10 CLS:CLV:CLT:OUT2,0
20 V=30
30 LC0,0:?"√›Ω≥:"
40 FOR I=0 TO 31
50 LC I,3:?"è"
60 NEXT

'Initialize ADXL345(I2C)
70 POKE #700,#31,#00:IF I2CW(#53,#700,1,#701,1)?"E"
80 POKE #700,#2D,#08:IF I2CW(#53,#700,1,#701,1)?"E"

'Initialize Game
'Target Object Ì
90 A=RND(30)+1:B=RND(15)+5
100 'LC A,B:?"Ì";:WAIT5:LC A,B:?" ";

'Mainloop 
'Read ADXL345(Adjust Center X+55,Y+93)
110 POKE #700,#32:IF I2CR(#53,#700,1,#701,6)?"E"
120 X=PEEK(#702)<<8+PEEK(#701):X=X+55:L=L+X/V
130 Y=PEEK(#704)<<8+PEEK(#703):Y=Y+93:T=T+Y/V*-1

140 IF L<1 L=1
150 IF L>30 L=30
160 IF T<5 T=5
170 IF T>20 T=20

'Move FINDER
180 IF L<>M||T<>U FOR I=-1 TO 2:LC M-1,U+I:?"   ";:NEXT:LC L-1,T-1:?"òëô";:LC L-1,T:?"í í";:LC L-1,T+1:?"öóõ";:LC L,T+2:?"í";:M=L:U=T

'Finder LED
190 P=ABS(L-A)+ABS(T-B):IF P%2>0 P=P+1
200 PWM 2,1000-(P/2)*700
210 IF P>3 THEN V=30 ELSE V=50

'Score & Initialize Game
220 B=IN(1)
230 LC L,T
240 IF B=0 && P<2 ?"Ì";:LC 14,12:?"–¬π¿!!";:S=S+1:LC 4+S,0:?"Ì";:WAIT 30:LC L,T:?CHR$(0);:LC 14,12:?"      ";:GOTO 90
250 IF B=0 ?"X";

'Time & GameOver
260 R=TICK()/120
270 LC 32-R,3:?CHR$(0)
280 IF 32-R=0 LC 12,12:?"GAME OVER":END

290 WAIT 1:IF B=0 GOTO 290
300 GOTO 110
