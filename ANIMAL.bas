' [0]Interval,[1]LastTick,[2]Left,[3]Top
' C,D Tray Left
' O   Tray On Animal
' L,R ìí Score
' M,S ìí
' v   Level

'1 'ÄÞ³ÌÞÂ

10 CLS:CLV:CLT:M=236:S=237:V=1
20 A=M:X=0:GOSUB 350
30 A=S:X=29:GOSUB 350

40 [0]=60:[4]=30:[8]=60:[12]=30:[16]=60:[20]=30

'Main loop
100 I=ANA(2)
110 C=(I-95)/(1023-95)*29

'Animal Move
120 FOR I=0 TO V
130 P=3*I+1*I
140 IF [P+1]=0 [P+1]=K-[P]*(RND(3)+1):[P+2]=RND(16)+8:[P+3]=-1
150 IF I%2=0 A=M ELSE A=S
160 GOSUB 280
'Catch Animal
170 IF [P+2]=C+1 && [P+3]=15 O=A:[P+1]=0
180 NEXT

'Tray Move
190 IF C<>D LC D+1,15:?" ";:LC D,16:?"   ";:D=C
200 LC C+1,15:?CHR$(O);:LC C,16:?"š‘›";

'Score
220 IF O=M && C=0 L=L+1:LC 1,22-L:?CHR$(O);:O=0
230 IF O=S && C=29 R=R+1:LC 30,22-R:?CHR$(O);:O=0

'LevelUp
240 LC 0,0:?"ÚÍÞÙ:";V;
250 IF L=5 L=0:V=V+1:A=M:X=0:GOSUB 350
260 IF R=5 R=0:V=V+1:A=S:X=29:GOSUB 350

'GameOver
265 IF Z=V LC 12,12:?"¹Þ-Ñµ-ÊÞ-";:GOTO 275
266 IF 5<V LC 12,12:?"¹Þ-Ñ¸Ø±-!";:GOTO 275

270 WAIT1:GOTO 100

'Push to Start
275 WAIT60
276 IF IN(1)=1 CONT
277 GOTO 100

'Animal
280 T=[P+3]
285 K=TICK()
290 IF [P+1]+[P]<K T=T+1:[P+1]=K
300 IF [P+3]<>T && 0<T && T<24 LC [P+2],[P+3]:?" ";:LC [P+2],T:?CHR$(A);
320 IF T=23 [P+1]=0:Z=Z+1
330 [P+3]=T
340 RETURN

' House
350 FOR I=0 TO 4
360 LC X,17+I:?"… Š";
370 NEXT
380 LC X,22:?"ŒŽ";
390 LC X+1,23:?CHR$(A);
400 RETURN
