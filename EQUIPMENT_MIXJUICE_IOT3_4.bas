﻿1 'IoT 3/4
10 Q=0:W=60*10:B=0
100 FOR L=0 TO 7
110  [L]=[10+L]
120 NEXT
130 VIDEO1:GOSUB 900:WAIT10*60
135 GOTO 1000
140 'WAIT W
200 'FOR S=0 TO 7
210 ' FOR L=0 TO 7
220 '  [L]=[L]<<1|[20+L]>>(7-S)
230 ' NEXT
240 ' GOSUB 900
250 ' WAIT 5
260 'NEXT
270 'WAIT 60*3
300 'FOR S=0 TO 7
310 ' FOR L=0 TO 7
320 '  [L]=[L]<<1|[30+L]>>(7-S)
330 ' NEXT
340 ' GOSUB 900
350 ' WAIT 5
360 'NEXT
370 'WAIT 60*5
400 'FOR S=0 TO 7
410 ' FOR L=0 TO 7
420 '  [L]=[30+L]>>(1+S)|[10+L]<<(7-S)
430 ' NEXT
440 ' GOSUB 900
450 ' WAIT 5
460 'NEXT
470 'WAIT W
500 'IF BTN()=1 THEN B=1
501 'IF BTN()=0&&B=1 THEN B=0:M=(M=0)
510 IF Q=5 LRUN 3
605 IF Q>59 LRUN 1
610 IF TICK() > 60*60 Q=Q+1:CLT
615 'IF M=1 THEN GOTO 100 ELSE GOTO 1000
616 IF BTN() THEN GOSUB 100:WAIT 5*60
620 WAIT 10:GOTO 500
900 Z=I2CW(C,D,1,#800,16) 
910 RETURN
1000 'LEDƸǘƱ
1010 FOR L=0 TO 7
1020  [L]=0
1030 NEXT
1040 VIDEO0:GOSUB 900
1050 GOTO 500