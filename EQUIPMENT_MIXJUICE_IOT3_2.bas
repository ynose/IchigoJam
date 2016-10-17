'IoT for IchigoJam + MixJuice
'IchigoJam BASIC 1.2.1

'T=Temperature
'A=Number [A|*]
'B=Number [*|B]
'J=JINKAN Sensor Value

NEW

'Sensor Update
1 'IoT 2/3

'---------------------------------
100 'Read TempSensor (0.0)
'110 IF I2CR(E,F+1,1,#800+16,1)?"E":'0.n
115 IF I2CR(E,F,  1,#801+16,1)?"E":'n.0
120 T=[8]/128
130 ?"Temp:";T;"ǟC [";[8];"]"

140 'Make Temp Number [A|B]
150 A=T/10:B=T%10
160 FOR I=30 TO 37
170  [I]=PEEK(#700+B*8+(I-30))
180  IF A>0 [I]=[I]|PEEK(#700+A*8+(I-30))<<4
190 NEXT

200 'Web Upload TempData
210 ?G;"data_add.php?s=0&v=";T

'---------------------------------
300 'Read JINKAN Sensor
310 J=IN(1)
320 ?"JINKAN:";J

330 'Web Upload JINKAN Data
340 ?G;"data_add.php?s=2&v=";J

350 'Web Exec SensorCheck
360 IF J=1 ?G;"sensor_check.php?s=2&c=1"

400 LRUN 3:'Main Loop

SAVE 2
