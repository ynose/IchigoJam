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
40 [I]=65+I:[30+I]=I
50 NEXT
60 FOR I=25 TO 1 STEP -1
70 J=RND(I+1):T=[I]:[I]=[J]:[J]=T
80 J=RND(I+1):T=[30+I]:[30+I]=[30+J]:[30+J]=T
90 NEXT

'Initialize Screen
100 FOR I=0 TO 31
110 LC I,6:?"-":LC I,16:?"-":LC I,19:?"-"
120 NEXT
130 FOR I=0 TO 25
140 LC 3+I,6:?CHR$(65+I)
150 LC 3+I,16:?CHR$([I])
160 NEXT

'Setup Level
170 V=V+1:LC 0,0:?"ÚÍÞÙ:";V
180 I=0
190 LC 3+[30+I],6:?" ":I=I+1:IF I<V GOTO 190
200 GOSUB 330

'Main loop
'210 A=ANA(2)
'220 A=A*10:C=A/1023:LC 1,1:?C;" "
210 K=INKEY()
220 IF K=29 L=L+1
230 IF K=28 L=L-1
240 IF L<1 L=1
250 IF L>30 L=30
260 B=BTN()
270 LC L-1,17+(B=0):?" û ";
280 LC L,17+(B=1):?" "

'Correct -> Next Word
290 IF B=1 && SCR(L,16)=W LC L,16:?" ":LC L,15:?CHR$(W):WAIT 60:LC 3+W-65,6:?CHR$(W):WAIT 60:GOSUB 330

'Next Level
300 IF W=0 V=26 LC 8,12:?"´²ºÞ Ï½À- !!":WAIT 60:END
310 IF W=0 LC 8,12:?"¾²¶² !!":WAIT 60:GOTO 20

320 WAIT1:GOTO 210

'Search Question
330 W=0
340 FOR I=0 TO 25
350 LC 3+I,7
360 IF SCR(3+I,6)=32 && W=0 THEN W=65+I:?"â" ELSE ?" "
370 NEXT
380 RETURN