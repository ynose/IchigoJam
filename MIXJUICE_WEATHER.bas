' T=µÝÄÞ AB
' A=10É¸×², B=1É¸×²
' C=Address MatrixLED
' D=Address ADT7410
' T=Return ADT7410
' W=ÃÝ· 1ÊÚ,2¸ÓØ,3±Ò
' M=Weather Get Mode w=Weather, t=Temperature
' Z=Return I2C

1 'ÃÝ·ÖÎ³ 1/4
10 CLS:CLV

' Number 0..9
100 POKE #700,#06,#09,#09,#09,#09,#09,#09,#06
110 POKE #708,#02,#06,#02,#02,#02,#02,#02,#02
120 POKE #710,#06,#09,#01,#01,#02,#04,#08,#0F
130 POKE #718,#06,#09,#01,#06,#01,#01,#09,#06
140 POKE #720,#02,#06,#0A,#0A,#0F,#02,#02,#02
150 POKE #728,#0F,#08,#08,#0E,#01,#01,#01,#0E
160 POKE #730,#06,#09,#08,#0E,#09,#09,#09,#06
170 POKE #738,#0F,#01,#01,#02,#02,#04,#04,#04
180 POKE #740,#06,#09,#09,#06,#09,#09,#09,#06
190 POKE #748,#06,#09,#09,#07,#01,#01,#09,#06

' Sun,Cloud,Rain
200 POKE #750,#10,#42,#18,#3D,#BC,#18,#42,#08
210 POKE #758,#00,#30,#48,#46,#81,#81,#7E,#00
220 POKE #760,#18,#24,#42,#81,#FF,#10,#14,#08

' Init MatrixLED
300 C=#70
310 POKE #770,#21,#81,#E1,#00
320 FOR M=#770 TO #772
330  Z=I2CW(C,M,1,#770,0)
340 NEXT

' Init ADT7410
400 D=#48
410 POKE #780,#00,#01,#02,#03
420 POKE #784,#80
430 Z=I2CW(D,#783,1,#784,1)

999 LRUN 101

SAVE 100


NEW
NEW


' Get Weather from MixJuice
1 'ÃÝ·ÖÎ³ 2/4
10 CLS:CLT:W=0:T=0

' Loading to MatrixLED
100 A=#FF*8
110 FOR L=0 TO 7
120  [L]=PEEK(A+L)
130 NEXT
140 Z=I2CW(C,#773,1,#800,16)
150 WAIT 60

' Get Weather
200 ?"MJ GET ynose.weblike.jp/weather.php?city=120010&mode=w"
210 ?"MJ GET ynose.weblike.jp/weather.php?city=120010&mode=w"
220 INPUT W:?"Weather:";W
225 WAIT 60

' Get Temperature
300 ?"MJ GET ynose.weblike.jp/weather.php?city=120010&mode=t"
310 INPUT T:?"Temperature:";T
315 WAIT 60
320 A=T/10:B=T%10

' Weather to Array[10-17]
400 FOR L=10 TO 17
410  [L]=PEEK(#750+(W-1)*8+(L-10))
420 NEXT

' Temperature to Array[20-27]
500 FOR L=20 TO 27
510  [L]=PEEK(#700+B*8+(L-20))
520  IF A>0 [L]=[L]|PEEK(#700+A*8+(L-20))<<4
530 NEXT

999 LRUN 102

SAVE 101


NEW
NEW


1 'ÃÝ·ÖÎ³ 3/4

' Weather to MatrixLED
100 FOR L=0 TO 7
110  [L]=[10+L]
120 NEXT
130 GOSUB 900
140 WAIT 60*3

' Weather -> Temperature
200 FOR S=0 TO 7
210  FOR L=0 TO 7
220   [L]=[L]<<1|[20+L]>>(7-S)
230  NEXT
240  GOSUB 900
250  WAIT 5
260 NEXT
270 WAIT 60*3

' Weather <- Temperature
300 FOR S=0 TO 7
310  FOR L=0 TO 7
320   [L]=[L]>>1|[10+L]<<(7-S)
330  NEXT
340  GOSUB 900
350  WAIT 5
360 NEXT
370 WAIT 60*3

' Goto ADT7410
400 IF BTN() LRUN 103

' Loop or Loading
500 IF TICK() < 60*60 GOTO 200
510 LRUN 101

' [0] to MatrixLED
900 Z=I2CW(C,#773,1,#800,16) 
910 RETURN

SAVE 102


NEW
NEW


1 'ÃÝ·ÖÎ³ 4/4

' Read ADT7410
10 Z=I2CR(D,#781,1,#800+16,1)
20 Z=I2CR(D,#780,1,#801+16,1)
30 T=[8]/128
40 ?"¿¸Ã²Á=";[8];" : µÝÄÞ=";T

' ADT7410 to LED
100 A=T/10:B=T%10
110 FOR L=0 TO 7
120  [L]=PEEK(#700+B*8+L)
130  IF A>0 [L]=[L]|PEEK(#700+A*8+L)<<4
140 NEXT
150 W=I2CW(C,#773,1,#800,16) 
160 WAIT 60*5

200 LRUN 102

SAVE 103
