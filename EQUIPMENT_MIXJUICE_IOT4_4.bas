1 'IoT 4/4
100 'ƵǝǄǞ
110 Z=I2CR(E,F,  1,#801+16,1)
120 T=[8]/128
130 ?"ƿƸǃƲǁ=";[8];" : ƵǝǄǞ=";T;"ǟC"
140 ?"MJ GET iot.ynoseapps.com/data_add.php?s=0&v=";T
200 A=T/10:B=T%10
210 FOR L=30 TO 37
220  [L]=PEEK(#700+B*8+(L-30))
230  IF A>0 [L]=[L]|PEEK(#700+A*8+(L-30))<<4
240 NEXT
241 FOR L=0 TO 7
242  [L]=[L+30]
243 NEXT
250 Z=I2CW(C,D,1,#800,16) 
300 'ƼǞǝƶǝ
310 J=IN(1)
320 ?"ƼǞǝƶǝ=";J
330 ?"MJ GET iot.ynoseapps.com/data_add.php?s=2&v=";J;"&c=1"
340 IF J=1 ?"MJ GET iot.ynoseapps.com/sensor_check.php?s=2&c=1"
900 WAIT 10*60
910 'LRUN 2
3000 FOR S=0 TO 7
3010  FOR L=0 TO 7
3020   [L]=[30+L]>>(1+S)|[10+L]<<(7-S)
3030  NEXT
3040  GOSUB 4000
3050  WAIT 5
3060 NEXT
3070 WAIT 5*60
3080 LRUN 2
4000 Z=I2CW(C,D,1,#800,16) 
4010 RETURN