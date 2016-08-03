'A,B BUG X,Y
'L,T FINDER X,Y
'S   Score

1 'Ñ¼Ò¶ÞÈ for JamCon
10 CLS:CLV:CLT:OUT2,0
20 V=30
30 FOR I=0 TO 31
40 LC I,3:?""
50 NEXT

'AXIS -> OUT3(ANA7), OUT4(ANA8)
60 OUT3,-1:OUT4,-1

'Initialize Game
'Target Object í
80 A=RND(30)+1:B=RND(15)+5:'LC A,B:?"í";

'Mainloop 
'Read AXIS
100 X=ANA(8)-512:L=L+X/V
110 Y=ANA(7)-512:T=T+Y/V*-1

'L=L+(1-L)*(1-L>0)+(30-L)*(30-L<0)
130 IF L<1 L=1
140 IF L>30 L=30
150 IF T<5 T=5
160 IF T>20 T=20

'Move FINDER
170 IF L<>M||T<>U FOR I=-1 TO 2:LC M-1,U+I:?"   ";:NEXT:LC L-1,T-1:?"˜‘™";:LC L-1,T:?"’ ’";:LC L-1,T+1:?"š—›";:LC L,T+2:?"’";:M=L:U=T

'Finder LED
180 P=ABS(L-A)+ABS(T-B)-(L<>A&&T<>B):'LC 30,0:?P;" ";
190 PWM 2,1000-(P/2)*700
200 IF P>3 THEN V=30 ELSE V=40

'Score & Initialize Game
210 F=IN(1)
220 LC0,0:?"ÃÝ½³:"
230 LC L,T
240 IF F=0 && P<2 ?"í";:LC 14,12:?"ÐÂ¹À!!";:S=S+1:LC 4+S,0:?"í";:WAIT 30:LC L,T:?CHR$(0);:LC 14,12:?"      ";:GOTO 80
250 IF F=0 ?"X";

'Time & GameOver
260 R=TICK()/120
270 LC 32-R,3:?CHR$(0)
280 IF 32-R=0 LC 12,12:?"GAME OVER";:GOSUB 310:GOTO 10

290 WAIT 1:IF F=0 GOTO 210
300 GOTO 100

'Push to Start
310 IF IN(1)=1 GOTO 310
320 RETURN

