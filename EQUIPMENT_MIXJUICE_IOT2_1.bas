'IoT for IchigoJam + MixJuice
'IchigoJam BASIC 1.2.1

NEW

'Weather,Sensor Update
1 'IoT 1/2
10 CLS
20 G="MJ GET iot.ynoseapps.com/"
30 W=0

50 IF N=>60 N=0:GSB @WEATHER
60 IF O=>5  O=0:GSB @TEMP:GSB @JINKAN

90 LRUN 3:'Main Loop

'Subroutines ---------------------
'Get Weather
100 @WEATHER
110 ?G;"weather.php?city=120010&mode=w"
120 INPUT W:?"Weather:";W

130 'Make Weather ICON
140 FOR I=10 TO 17
150  [I]=PEEK(#760+(W-1)*8+(I-10))
160 NEXT

170 RTN

'---------------------------------
'Read TempSensor (0.0)
200 @TEMP
'110 IF I2CR(E,F+1,1,#800+16,1)?"E":'0.n
215 IF I2CR(E,F,  1,#801+16,1)?"E":'n.0
220 T=[8]/128
230 ?"Temp:";T;"ǟC [";[8];"]"

240 'Make Temp Number [A|B]
250 A=T/10:B=T%10
260 FOR I=30 TO 37
270  [I]=PEEK(#700+B*8+(I-30))
280  IF A>0 [I]=[I]|PEEK(#700+A*8+(I-30))<<4
290 NEXT

300 'Web Upload TempData
310 ?G;"data_add.php?s=0&v=";T

320 RTN

'---------------------------------
'Read JINKAN Sensor
400 @JINKAN
410 J=IN(1)
420 ?"JINKAN:";J

430 'Web Upload JINKAN Data
440 ?G;"data_add.php?s=2&v=";J

450 'Web Exec SensorCheck
460 IF J=1 ?G;"sensor_check.php?s=2&c=1"

470 RTN

SAVE 1
