NEW


' 102 ----------
' Display WeatherForecast to MatrixLED
1 'ÃÝ·ÖÎ³ 3/4

10 Q=0
' Weather to MatrixLED
100 FOR L=0 TO 7
110  [L]=[10+L]
120 NEXT
130 GOSUB 900
140 WAIT 60*3

' Weather -> Temperature Diff (Scroll)
200 FOR S=0 TO 7
210  FOR L=0 TO 7
220   [L]=[L]<<1|[20+L]>>(7-S)
230  NEXT
240  GOSUB 900
250  WAIT 5
260 NEXT
270 WAIT 60*3

' Temperature Diff -> Temperature (Scroll)
300 FOR S=0 TO 7
310  FOR L=0 TO 7
320   [L]=[L]<<1|[30+L]>>(7-S)
330  NEXT
340  GOSUB 900
350  WAIT 5
360 NEXT
370 WAIT 60*3

' Weather <- Temperature (Scroll)
400 FOR S=0 TO 7
410  FOR L=0 TO 7
420   [L]=[30+L]>>(1+S)|[10+L]<<(7-S)
430  NEXT
440  GOSUB 900
450  WAIT 5
460 NEXT
470 WAIT 60*3

' Push Button Goto ADT7410
500 IF BTN() LRUN 103

' Loop or Reload(Q=10min.)
600 IF TICK() > 60*60 Q=Q+1:CLT
610 IF Q>9 LRUN 101
620 GOTO 200

' [0] to MatrixLED
900 Z=I2CW(C,D,1,#800,16) 
910 RETURN

SAVE 102
