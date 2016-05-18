' C,D Drop Tick
' W,H Glass Width,Height
' A,B Water Width,Height
' S   Score

10 CLS:CLV:CLT:L=10:A=0:B=0

'Next Glass
20 W=1:H=5
30 A=0:B=0

'Main loop
40 I=ANA(2)
50 C=(I-95)*10/(1023-95)
60 K=TICK()
70 IF D+C<K D=K:GOSUB 110

80 IF H=B && W=A && C=0 S=S+1:GOTO 20
90 IF H<B LC 20,20:?"GAME OVER":END


100 GOTO 40

'Drop Water
110 P=0:T=10
120 K=TICK()
130 IF P+30<K T=T+1:P=K
140 IF U<>T LC L,U:?" ";:LC L,T:?"";
150 U=T
160 IF T=30-B&&A<W A=A+1:LC L-A,B:?"";
170 IF A=W B=B+1:A=0
180 IF T<30-B GOTO 120
190 RETURN



