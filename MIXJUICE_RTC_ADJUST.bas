1 ' RTC Adjust MIXJUICE
10 CLS
20 PRINT
30 CLT:P=#707

100 ?"MJ GET ynose.weblike.jp/ij/time.php?f=y"
110 ?"YEAR   20";:INPUT I:GOSUB 300

120 ?"MJ GET ynose.weblike.jp/ij/time.php?f=n"
130 ?"MONTH  ";:INPUT I:GOSUB 300

140 ?"MJ GET ynose.weblike.jp/ij/time.php?f=j"
150 ?"DAY    ";:INPUT I:GOSUB 300

140 ?"MJ GET ynose.weblike.jp/ij/time.php?f=G"
150 ?"HOUR   ";:INPUT I:GOSUB 300

160 ?"MJ GET ynose.weblike.jp/ij/time.php?f=i"
170 ?"MINUTE ";:INPUT I:GOSUB 300

180 ?"MJ GET ynose.weblike.jp/ij/time.php?f=a"
190 ?"SECOND ";:INPUT I:GOSUB 300

200 ?"---SET RTC---"
210 POKE #700,0:POKE #704,0
220 Z=I2CW(#68,#700,1,#701,7)
230 END

300 I=I/10*16+I%10:POKE P,I
310 P=P-1
320 IF P=#704 P=#703
330 ?HEX$(I,2)
340 RETURN