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
