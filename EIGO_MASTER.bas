' H   Hole Left
' I   Loop counter
' L,T Left, Top
' V   Level
' W   Question Word

1 '´²ºÞÏ½À-
10 CLV
20 CLS

'Shuffle Algorithm
30 FOR I=0 TO 25
40 [I]=65+I
50 NEXT
60 FOR I=25 TO 1 STEP -1
70 J=RND(I+1):T=[I]:[I]=[J]:[J]=T
80 NEXT

'Initialize Screen
90 FOR I=0 TO 31
100 LC I,6:?"-":LC I,16:?"-":LC I,19:?"-"
110 NEXT
120 FOR I=0 TO 25
130 LC 3+I,6:?CHR$(65+I)
140 LC 3+I,16:?CHR$([I])
150 NEXT

'Setup Level
160 V=V+1:LC 0,0:?"ÚÍÞÙ:";V
170 I=0
180 H=RND(26):IF SCR(3+H,6)<>32 I=I+1:LC 3+H,6:?" "
190 IF I<V THEN GOTO 180
200 GOSUB 340

'Main loop
'200 A=ANA(2)
'210 A=A*10:C=A/1023:LC 1,1:?C;" "
210 K=INKEY()
220 IF K=29 L=L+1
230 IF K=28 L=L-1
240 IF L<1 L=1
250 IF L>30 L=30
260 B=BTN()
270 LC L-1,17+(B=0):?" û ";
280 LC L,17+(B=1):?" "

'Correct -> Next Word
300 IF B=1 && SCR(L,16)=W LC 3+W-65,6:?CHR$(W):GOSUB 340

'Next Level
310 IF W=0 V=26 LC 8,12:?"´²ºÞ Ï½À- !!":WAIT 60:END
320 IF W=0 LC 8,12:?"¾²¶² !!":WAIT 60:GOTO 20

330 WAIT1:GOTO 210

'Search Question
340 W=0
350 FOR I=0 TO 25
360 LC 3+I,7
370 IF SCR(3+I,6)=32 && W=0 THEN W=65+I:?"â" ELSE ?" "
380 NEXT
390 RETURN
