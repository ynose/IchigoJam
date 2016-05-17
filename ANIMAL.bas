' [0]Interval,[1]LastTick,[2]Left,[3]Top
' C,D Tray Left
' O   Tray On Animal
' L,R ìí Score
' M,S ìí
' v   Level

'ÄÞ³ÌÞÂ
10 CLS:CLV:CLT:M=236:S=237:V=1
20 A=M:X=0:GOSUB 340
30 A=S:X=29:GOSUB 340

40 [0]=60:[4]=30:[8]=60:[12]=30:[16]=60:[20]=30

'Main loop
50 I=ANA(2)
60 C=(I-95)*29/(1023-95)

'Animal Move
70 FOR I=0 TO V
80 P=3*I+1*I
90 IF [P+1]=0 [P+1]=K+[P]*(RND(3)+1):[P+2]=RND(16)+8:[P+3]=-1
100 IF I%2=0 A=M ELSE A=S
110 GOSUB 270
'Catch Animal
120 IF [P+2]=C+1&&[P+3]=15 O=A:[P+1]=0
130 NEXT

'Tray Move
140 IF C<>D LC D+1,15:?" ";:LC D,16:?"   ";:D=C
150 LC C+1,15:?CHR$(O);:LC C,16:?"š‘›";

'Score
160 IF O=M&&C=0 L=L+1:LC 1,22-L:?CHR$(O);:O=0
170 IF O=S&&C=29 R=R+1:LC 30,22-R:?CHR$(O);:O=0

'LevelUp
180 LC 0,0:?"ÚÍÞÙ:";V;
190 IF L=5 L=0:V=V+1:A=M:X=0:GOSUB 340
200 IF R=5 R=0:V=V+1:A=S:X=29:GOSUB 340

'GameOver
210 IF Z=V LC 12,12:?"¹Þ-Ñµ-ÊÞ-";:GOTO 240
220 IF 5<V LC 14,12:?"¸Ø±-!";:GOTO 240

230 WAIT1:GOTO 50

'Push to Start
240 WAIT60
250 IF IN(1)=1 CONT
260 GOTO 50

'Animal
270 T=[P+3]
280 K=TICK()
290 IF [P+1]+[P]<K T=T+1:[P+1]=K
300 IF [P+3]<>T&&0<T&&T<24 LC [P+2],[P+3]:?" ";:LC [P+2],T:?CHR$(A);
310 IF T=23 [P+1]=0:Z=Z+1
320 [P+3]=T
330 RTN

' House
340 FOR I=0 TO 4:LC X,17+I:?"… Š";:NEXT
370 LC X,22:?"ŒŽ";
380 LC X+1,23:?CHR$(A);
390 RTN


