' [0]Interval,[1]LastTick,[2]Left,[3]Top
' C,D Tray Left
' O   Tray On Animal
' L   �Left Score
' R   �Right Score
' v   Level

'1 '�޳���

10 CLS:CLV:CLT:V=1
20 A=236:X=0:GOSUB 350
30 A=237:X=29:GOSUB 350

40 [0]=60
50 [4]=30
60 [8]=60
70 [12]=30
80 [16]=60
90 [20]=30

'Main loop
100 I=ANA(2)
110 I=(I-95)*29:C=I/(1023-95)

'Animal Move
120 FOR I=0 TO 5
130 P=3*I+1*I
140 IF [P+1]=0 [P+2]=RND(16)+8:[P+3]=RND([P]/2)+1:[P+3]=[P+3]*-1
150 IF I%2=0 A=236 ELSE A=237
160 GOSUB 280
'Catch Animal
170 IF [P+3]=15&&[P+2]=C+1 O=A:[P+1]=0
180 NEXT

'Tray Move
190 IF C<>D LC D+1,15:?" ";:LC D,16:?"   ";
200 LC C+1,15:?CHR$(O);:LC C,16:?"���";
210 D=C

'Score
220 IF O=236&&C=0  L=L+1:LC 1,22-L:?CHR$(O);:O=0
230 IF O=237&&C=29 R=R+1:LC 30,22-R:?CHR$(O);:O=0

'LevelUp
240 LC 0,0:?"����:";V;
250 IF L=5 L=0:V=V+1:A=236:X=0:GOSUB 350
260 IF R=5 R=0:V=V+1:A=237:X=29:GOSUB 350

'GameOver
265 IF Z=V LC 12,12:?"��-ѵ-��-";:GOSUB 410:GOTO 100

270 WAIT1:GOTO 100

'Animal
280 S=TICK():T=[P+3]
290 IF [P+1]+[P]<S T=T+1:[P+1]=S
300 IF [P+3]<>T && 0<T && T<24 LC [P+2],[P+3]:?" ";:LC [P+2],T:?CHR$(A);
320 IF T=23 [P+1]=0:Z=Z+1
330 [P+3]=T
340 RETURN

' House
350 FOR I=0 TO 4
360 LC X,17+I:?"� �";
370 NEXT
380 LC X,22:?"���";
390 LC X+1,23:?CHR$(A);
400 RETURN

'Push to Start
410 IF IN(1)=1 CONT
420 RETURN