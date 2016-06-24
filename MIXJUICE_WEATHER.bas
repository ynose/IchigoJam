' Weather Forecast for IchigoJam + MixJuice
' IchigoJam BASIC 1.1.1

' T=·µÝ AB
' A=10É¸×², B=1É¸×²
' C=MatrixLED Address
' D=MatrixLED Command
' E=ADT7410 Address
' F=ADT7410 Command
' L=[L] Array index
' T=Return ADT7410
' W=ÃÝ· 1ÊÚ,2¸ÓØ,3±Ò
' M=QueryString mode=w...Weather, t...Temperature
' Z=I2CR(),I2CW()

' 100 ----------
' Init LED Pattern, Init I2C Device
1 'ÃÝ·ÖÎ³ 1/4
10 CLS:CLV

' Number 0..9
100 POKE #700,#06,#09,#09,#09,#09,#09,#09,#06
110 POKE #708,#02,#06,#02,#02,#02,#02,#02,#02
120 POKE #710,#06,#09,#01,#01,#02,#04,#08,#0F
130 POKE #718,#06,#09,#01,#06,#01,#01,#09,#06
140 POKE #720,#02,#06,#0A,#0A,#0F,#02,#02,#02
150 POKE #728,#0F,#08,#08,#0E,#01,#01,#09,#06
160 POKE #730,#06,#09,#08,#0E,#09,#09,#09,#06
170 POKE #738,#0F,#01,#01,#02,#02,#04,#04,#04
180 POKE #740,#06,#09,#09,#06,#09,#09,#09,#06
190 POKE #748,#06,#09,#09,#07,#01,#01,#09,#06
' - +
200 POKE #750,#00,#00,#00,#E0,#00,#00,#00,#00
210 POKE #758,#00,#00,#40,#E0,#40,#00,#00,#00

' Weather icon Sun,Cloud,Rain
220 POKE #760,#10,#42,#18,#3D,#BC,#18,#42,#08
230 POKE #768,#00,#30,#48,#46,#81,#81,#7E,#00
240 POKE #770,#18,#24,#42,#81,#FF,#10,#14,#08

' Init MatrixLED
300 C=#70:D=#783
310 POKE #780,#21,#81,#E1,#00
320 FOR M=#780 TO #782
330  Z=I2CW(C,M,1,#780,0)
340 NEXT

' Init ADT7410
400 E=#48:F=#790
410 POKE #790,#00,#01,#02,#03
420 POKE #794,#80
430 Z=I2CW(E,#793,1,#794,1)

999 LRUN 101

SAVE 100


NEW
NEW


' 101 ----------
' Get WeatherForecast from Web(MixJuice)
1 'ÃÝ·ÖÎ³ 2/4
10 CLS
20 PRINT
30 CLT:W=0:T=0

' Loading to MatrixLED
100 A=#FF*8
110 FOR L=0 TO 7
120  [L]=PEEK(A+L)
130 NEXT
140 Z=I2CW(C,D,1,#800,16)
150 WAIT 60

' Get Weather
200 '?"MJ GET ynose.weblike.jp/weather.php?city=120010&mode=w"
210 ?"MJ GET ynose.weblike.jp/ij/weather.php?city=120010&mode=w"
220 INPUT W:?"Weather:";W
' Weather icon to Array[10-17]
230 FOR L=10 TO 17
240  [L]=PEEK(#760+(W-1)*8+(L-10))
250 NEXT


' Get Temperature Diff
300 ?"MJ GET ynose.weblike.jp/ij/weather.php?city=120010&mode=d"
310 INPUT Y:?"Temperature Diff:";Y;"ßC"
320 B=ABS(Y)

' Temperature Diff(-9..+9) to Array[20-27]
330 FOR L=20 TO 27
340  [L]=PEEK(#700+B*8+(L-20))
360  IF Y<0 [L]=PEEK(#750+(L-20))|[L]
350  IF Y>0 [L]=PEEK(#758+(L-20))|[L]
370 NEXT


' Get Temperature
400 ?"MJ GET ynose.weblike.jp/ij/weather.php?city=120010&mode=t"
410 INPUT T:?"Temperature:";T;"ßC"
420 A=T/10:B=T%10

' Temperature to Array[30-37]
430 FOR L=30 TO 37
440  [L]=PEEK(#700+B*8+(L-30))
450  IF A>0 [L]=[L]|PEEK(#700+A*8+(L-30))<<4
460 NEXT

999 LRUN 102

SAVE 101


NEW
NEW


' 102 ----------
' Display WeatherForecast to MatrixLED
1 'ÃÝ·ÖÎ³ 3/4

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
420   [L]=[L]>>1|[10+L]<<(7-S)
430  NEXT
440  GOSUB 900
450  WAIT 5
460 NEXT
470 WAIT 60*3

' Push Button Goto ADT7410
500 IF BTN() LRUN 103

' Loop or Loading
600 IF TICK() < 60*60 GOTO 200
610 LRUN 101

' [0] to MatrixLED
900 Z=I2CW(C,D,1,#800,16) 
910 RETURN

SAVE 102


NEW
NEW


' 103 ----------
1 'ÃÝ·ÖÎ³ 4/4

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
260 WAIT 60*5

300 LRUN 102

SAVE 103
