' T=µÝÄÞ AB
' A=10É¸×², B=1É¸×²
' W=ÃÝ· 1ÊÚ,2¸ÓØ,3±Ò
' M=Weather Get Mode w=Weather, t=Temperature

1 'ÃÝ·ÖÎ³
10 CLS:CLV

' Number 0..9
11 POKE #700,#06,#09,#09,#09,#09,#09,#09,#06
12 POKE #708,#02,#06,#02,#02,#02,#02,#02,#02
13 POKE #710,#06,#09,#01,#01,#02,#04,#08,#0F
14 POKE #718,#06,#09,#01,#06,#01,#01,#09,#06
15 POKE #720,#02,#06,#0A,#0A,#0F,#02,#02,#02
16 POKE #728,#0F,#08,#08,#0E,#01,#01,#01,#0E
17 POKE #730,#06,#09,#08,#0E,#09,#09,#09,#06
18 POKE #738,#0F,#01,#01,#02,#02,#04,#04,#04
19 POKE #740,#06,#09,#09,#06,#09,#09,#09,#06
20 POKE #748,#06,#09,#09,#07,#01,#01,#09,#06

' Sun,Cloud,Rain
21 POKE #750,#10,#42,#18,#3D,#BC,#18,#42,#08
22 POKE #758,#00,#30,#48,#46,#81,#81,#7E,#00
23 POKE #760,#18,#24,#42,#81,#FF,#10,#14,#08

' Init MatrixLED
30 POKE #770,#21,#81,#E1,#00
40 FOR M=#770 TO #772
50  W=I2CW(#70,M,1,#770,0)
60 NEXT
70 LRUN 101

SAVE 100


' Get Weather from MixJuice
NEW

100 CLT:W=0:T=0:WAIT 60

' Get Weather
110 ?"MJ GET ynose.weblike.jp/weather.php?city=120010&mode=w"
116 ?"MJ GET ynose.weblike.jp/weather.php?city=120010&mode=w"
120 INPUT W:?"Weather:";W

' Get Temperature
130 ?"MJ GET ynose.weblike.jp/weather.php?city=120010&mode=t"
140 INPUT T:?"Temperature:";T
150 A=T/10:B=T%10

' Weather to Array[10-17]
200 FOR L=10 TO 17
210  [L]=PEEK(#750+(W-1)*8+(L-10))
220 NEXT

' Temperature to Array[20-27]
300 FOR L=20 TO 27
310  [L]=PEEK(#700+B*8+(L-20))
320  IF A>0 [L]=[L]|PEEK(#700+A*8+(L-20))<<4
330 NEXT
400 LRUN 102

SAVE 101


NEW

' Weather to MatrixLED
440 FOR L=0 TO 7
450  [L]=[10+L]
460 NEXT
470 GOSUB 900
480 WAIT 60*3

' Weather -> Temperature
500 FOR S=0 TO 7
510  FOR L=0 TO 7
520   [L]=[L]<<1|[20+L]>>(7-S)
530  NEXT
540  GOSUB 900
554  WAIT 5
560 NEXT
570 WAIT 60*3

' Weather <- Temperature
600 FOR S=0 TO 7
610  FOR L=0 TO 7
620   [L]=[L]>>1|[10+L]<<(7-S)
630  NEXT
640  GOSUB 900
654  WAIT 5
660 NEXT
670 WAIT 60*3

700 GOTO 500

' [0] to MatrixLED
900 W=I2CW(#70,#773,1,#800,16) 
910 RETURN

SAVE 102
