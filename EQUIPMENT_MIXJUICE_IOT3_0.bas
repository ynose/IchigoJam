'IoT for IchigoJam + MixJuice
'IchigoJam BASIC 1.2.1

'A=I2C Memory Address
'C=I2C MatrixLED Address
'D=I2C MatrixLED Command
'E=I2C TempSensor Address
'F=I2C TempSensor Command

NEW

'Init MatrixLED Pattern, Init I2C Device
1 'IoT 0/3
10 CLS:CLV
20 N=0:O=0:M=#800
30 V=0:'VIDEO

100 '0..9
101 POKE #700,#06,#09,#09,#09,#09,#09,#09,#06
102 POKE #708,#02,#06,#02,#02,#02,#02,#02,#02
103 POKE #710,#06,#09,#01,#01,#02,#04,#08,#0F
104 POKE #718,#06,#09,#01,#06,#01,#01,#09,#06
105 POKE #720,#02,#06,#0A,#0A,#0F,#02,#02,#02
106 POKE #728,#0F,#08,#08,#0E,#01,#01,#09,#06
107 POKE #730,#06,#09,#08,#0E,#09,#09,#09,#06
108 POKE #738,#0F,#01,#01,#02,#02,#04,#04,#04
109 POKE #740,#06,#09,#09,#06,#09,#09,#09,#06
110 POKE #748,#06,#09,#09,#07,#01,#01,#09,#06
120 '-+
121 POKE #750,#00,#00,#00,#E0,#00,#00,#00,#00
122 POKE #758,#00,#00,#40,#E0,#40,#00,#00,#00
130 'Weather 1:Sun,2:Cloud,3:Rain
131 POKE #760,#10,#42,#18,#3D,#BC,#18,#42,#08
132 POKE #768,#00,#30,#48,#46,#81,#81,#7E,#00
133 POKE #770,#18,#24,#42,#81,#FF,#10,#14,#08

200 'Init MatrixLED
210 C=#70:D=#783
220 POKE #780,#21,#81,#E1,#00
230 FOR A=#780 TO #782
240  IF I2CW(C,A,1,#780,0)?"E"
250 NEXT

300 'Init TempSensor(ADT7410)
310 E=#48:F=#790
320 POKE #790,#00,#01,#02,#03
330 POKE #794,#80
340 IF I2CW(E,#793,1,#794,1)?"E"

'System On
500 'Display Ichigo ICON 
'510 A=#FF*8
'520 FOR I=0 TO 7
'530  [I]=PEEK(A+I)
'540 NEXT
510 COPY M,#FF*8,16
550 GSB @MLED
560 WAIT 60

600 LRUN 1:'Weather Update

'Subroutines ---------------------
900 @MLED:'Display to MatrixLED
902 IF I2CW(C,D,1,M,16)?"E" 
903 RTN

SAVE 0
