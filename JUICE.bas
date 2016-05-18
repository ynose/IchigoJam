' C,D Water Drop Tick
' W,H Glass Width,Height
' A,B Water Width,Height
' S   Score

'1 '¼Þ­-½
10 CLS:CLV:CLT:L=10

'Next Glass
20 W=RND(3)+1:H=RND(5)+1:GOSUB 240
30 A=0:B=0
40 LC 0,0:?"ÃÝ½³:";S;


'Main loop
50 I=ANA(2)
60 C=(I-95)*10/(1023-95)
70 K=TICK()
80 IF D+C<K D=K:GOSUB 150

90 IF H=B && W=A && C=0 S=S+1:GOTO 20
100 IF H<B LC 20,20:?"OVER FLOW!!":GOTO 120


110 GOTO 50

'Push to Start
120 WAIT60
130 IF IN(1)=1 CONT
140 GOTO 20

'Drop Water
150 P=0:T=10
160 K=TICK()
170 IF P+30<K T=T+1:P=K
180 IF U<>T LC L,U:?" ";:LC L,T:?"";
190 U=T
200 IF T=30-B&&A<W LC L-A,B:?"";:A=A+1:
210 IF A=W B=B+1:A=0
220 IF T<30-B GOTO 160
230 RETURN


'Draw Glass
240 FOR Y=0 TO 6
250 LC L-3,31-Y:?"     ";
260 NEXT
270 FOR I=1 TO H
280 LC L-W,30-I:?"";LC L+1,30-I:?""
290 NEXT
300 LC L-W,31:?"š";FOR I=1 TO W:LC L-W+I,31:?"‘";:LC L+1,31:?"›"
310 RETURN
