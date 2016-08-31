NEW
NEW


' 103 ----------
1 'ÃÝ·ÖÎ³ 4/4
5 Q=0:CLT

' Read ADT7410
100 Z=I2CR(E,F+1,1,#800+16,1)
110 Z=I2CR(E,F,  1,#801+16,1)
120 T=[8]/128
130 ?"¿¸Ã²Á=";[8];" : µÝÄÞ=";T;"ßC"

' ADT7410 to LED
200 A=T/10:B=T%10
210 FOR L=0 TO 7
220  [L]=PEEK(#700+B*8+L)
230  IF A>0 [L]=[L]|PEEK(#700+A*8+L)<<4
240 NEXT
250 Z=I2CW(C,D,1,#800,16) 
'260 WAIT 60*5

300 IF TICK() > 60*60 Q=Q+1:CLT
310 IF Q>0 GOSUB 400
320 GOTO 100

'300 LRUN 2

400 ?"MJ GET iot.ynoseapps.com/temperature_add.php?c=";T
410 RETURN

SAVE 3
