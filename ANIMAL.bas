' [0]Interval,[1]LastTick,[2]Top,[3]Left
' C,D Tray Left
' O   Tray On Animal
' L   ìLeft Score
' R   íRight Score
' v   Level

'1 'ÄÞ³ÌÞÂ

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
140 IF [P+1]=0 [P+3]=RND(8)+12:[P+2]=RND([P]/2)+1:[P+2]=[P+2]*-1
150 IF I%2=0 A=236 ELSE A=237
160 GOSUB 280:WAIT 1
'Catch Animal
170 IF [P+2]=15&&[P+3]=C+1 O=A:[P+1]=0
180 NEXT

'Tray Move
190 IF C<>D LC D+1,15:?" ";:LC D,16:?"   ";
200 LC C+1,15:?CHR$(O);:LC C,16:?"š‘›";
210 D=C

'Score
220 IF O=236&&C=0  L=L+1:LC 1,22-L:?CHR$(O);:O=0
230 IF O=237&&C=29 R=R+1:LC 30,22-R:?CHR$(O);:O=0

'LevelUp
240 LC 0,0:?"ÚÍÞÙ:";V;
250 IF L=5 L=0:V=V+1:A=236:X=0:GOSUB 350
260 IF R=5 R=0:V=V+1:A=237:X=29:GOSUB 350

270 WAIT1:GOTO 100

'Animal
280 S=TICK():T=[P+2]
290 IF [P+1]+[P]<S T=T+1:[P+1]=S
300 IF [P+2]<>T && 0<T LC [P+3],[P+2]:?" ";
310 IF 0<=T && T<23 LC [P+3],T:?CHR$(A);
320 IF T=23 [P+1]=0
330 [P+2]=T
340 RETURN

' House
350 FOR I=0 TO 4
360 LC X,17+I:?"… Š";
370 NEXT
380 LC X,22:?"ŒŽ";
390 LC X+1,23:?CHR$(A);
400 RETURN
