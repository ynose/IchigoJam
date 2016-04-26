' J=IN(1) -> Jump button
' W=IN(4) -> Walk button
' OUT O -> LED Red(1), Yellow(2), Green(3), Blue(4)
' C -> JumpMan Position X
' X,Y -> Draw Screen X,Y

1 'LED_JUMPMAN
2 CLS:CLV

'Main loop
10 J=IN(1)
20 W=IN(4)

'Walk & Jump button Push
30 X=26:Y=19:IF W=0 THEN GOSUB 300 ELSE GOSUB 200
40 X=1 :Y=19:IF J=0 THEN GOSUB 300 ELSE GOSUB 200

'Walk & Jump
50 IF C<31 THEN C=C+1 ELSE C=0
60 IF J=1 AND W=0 THEN LOCATE C,15:?" û"
70 IF J=0 AND W=1 THEN LOCATE C,14:?" û":LOCATE C,15:?"  "
80 IF J=1 AND W=1 THEN LOCATE C,15:?" ù":LOCATE C,14:?"  "

'4 colors LED On/Off
100 O=1:X=6 :Y=10:IF C=X AND J=0 THEN GOSUB 500 ELSE GOSUB 400
110 O=2:X=11:Y=10:IF C=X AND J=0 THEN GOSUB 500 ELSE GOSUB 400
120 O=3:X=16:Y=10:IF C=X AND J=0 THEN GOSUB 500 ELSE GOSUB 400
130 O=4:X=21:Y=10:IF C=X AND J=0 THEN GOSUB 500 ELSE GOSUB 400

190 WAIT 5:GOTO 10

'Button Up
200 LC X,Y  :?" ‡ƒ‹ "
210 LC X,Y+1:?" ŒŽ "
220 LC X,Y+2:?"    "
230 LC X,Y+3:?"‡ƒƒƒ‹"
240 RETURN

'Button Down'
300 LC X,Y  :?"     "
310 LC X,Y+1:?" ‡ƒ‹ "
320 LC X,Y+2:?" ŒŽ "
330 LC X,Y+3:?"‡ƒƒƒ‹"
340 RETURN

'LED Off
400 LC X,Y  :?"    "; 
410 LC X,Y+1:?" †‰ ";
420 LC X,Y+2:?" …Š ";
430 LC X,Y+3:?" ‡‹ ";
440 OUT O,0
450 RETURN

'LED On
500 LC X,Y  :?" ** "; 
510 LC X,Y+1:?"*†‰*";
520 LC X,Y+2:?" …Š ";
530 LC X,Y+3:?" ‡‹ ";
540 OUT O,1
550 RETURN
