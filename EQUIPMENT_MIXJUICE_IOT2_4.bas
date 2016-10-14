1 'IoT 2/4
10 CLS
20 PRINT
30 CLT:W=0:T=0
100 A=#FF*8
110 FOR L=0 TO 7
120  [L]=PEEK(A+L)
130 NEXT
140 Z=I2CW(C,D,1,#800,16)
150 WAIT 60
210 ?"MJ GET ynose.weblike.jp/ij/weather.php?city=120010&mode=w"
220 INPUT W:?"Weather:";W
230 FOR L=10 TO 17
240  [L]=PEEK(#760+(W-1)*8+(L-10))
250 NEXT
300 '?"MJ GET ynose.weblike.jp/ij/weather.php?city=120010&mode=d"
310 'INPUT Y:?"Temperature Diff:";Y;"ǟC"
320 'B=ABS(Y)
330 'FOR L=20 TO 27
340 ' [L]=PEEK(#700+B*8+(L-20))
350 ' IF Y>0 [L]=PEEK(#758+(L-20))|[L]
360 ' IF Y<0 [L]=PEEK(#750+(L-20))|[L]
370 'NEXT
400 '?"MJ GET ynose.weblike.jp/ij/weather.php?city=120010&mode=t"
410 'INPUT T:?"Temperature:";T;"ǟC"
420 'A=T/10:B=T%10
430 'FOR L=30 TO 37
440 ' [L]=PEEK(#700+B*8+(L-30))
450 ' IF A>0 [L]=[L]|PEEK(#700+A*8+(L-30))<<4
460 'NEXT
999 LRUN 2