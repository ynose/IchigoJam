' C,D Water Drop Tick
' W,H Glass Width,Height
' A,B Water Width,Height
' S   Score

'1 '�ޭ-�
10 CLS:CLV:CLT:L=18
20 LC23,3:?        ""
30 LC21,4:?      ""
40 LC23,5:?        ""
50 LC22,6:?       "  "
60 LC18,7:?   ""
70 LC17,8:?  ""
80 LC17,9:?  "    "
90 LC17,10:? ""

'Next Glass
110 W=RND(3)+1:H=RND(5)+1:GOSUB 330
120 A=0:B=0
130 LC 0,0:?"�ݽ�:";S;


'Main loop
140 I=ANA(2)
150 C=(I-95)*10/(1023-95)
151 LC 26,0:?"C";C;" ";
152 IF H=B&&A=0&&C=0 S=S+1:GOTO 110
153 IF C<2 GOTO 140
160 K=TICK()
170 IF D+10<K D=K:GOSUB 240

190 IF H<B||H=B&&A=1 LC 20,20:?"����!!":GOTO 210
191 LC 20,0:?"H";H;"B";B;:LC 20,1:?"W";W;"A";A;
200 WAIT1:GOTO 140

'Push to Start
210 WAIT60
220 IF IN(1)=1 CONT
230 GOTO 10

'Drop Water
240 P=0:T=11
250 K=TICK()
260 IF P+0<K T=T+1:P=K
270 IF U<>T&&U<22-B LC L,U:?" ";:LC L,T:?"";
280 U=T
290 IF T=23-B&&A<W LC L-A,22-B:?"";:A=A+1
300 IF T<23-B GOTO 250
310 IF A=W B=B+1:A=0
320 RTN

'Draw Glass
330 FOR Y=0 TO 5:LC L-3,23-Y:?"     ";:NEXT
340 FOR I=1 TO H:LC L-W,23-I:?"";:LC L+1,23-I:?"";:NEXT
350 LC L-W,23:?"�";:FOR I=L-W+1 TO 18:LC I,23:?"�";:NEXT:LC L+1,23:?"�";
360 RTN

