NEW


' 101 ----------
' Get WeatherForecast from Web(MixJuice)
1 '√›∑÷Œ≥ 2/4
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
310 INPUT Y:?"Temperature Diff:";Y;"ﬂC"
320 B=ABS(Y)

' Temperature Diff(-9..+9) to Array[20-27]
330 FOR L=20 TO 27
340  [L]=PEEK(#700+B*8+(L-20))
360  IF Y<0 [L]=PEEK(#750+(L-20))|[L]
350  IF Y>0 [L]=PEEK(#758+(L-20))|[L]
370 NEXT


' Get Temperature
400 ?"MJ GET ynose.weblike.jp/ij/weather.php?city=120010&mode=t"
410 INPUT T:?"Temperature:";T;"ﬂC"
420 A=T/10:B=T%10

' Temperature to Array[30-37]
430 FOR L=30 TO 37
440  [L]=PEEK(#700+B*8+(L-30))
450  IF A>0 [L]=[L]|PEEK(#700+A*8+(L-30))<<4
460 NEXT

999 LRUN 102

SAVE 101
