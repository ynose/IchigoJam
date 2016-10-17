'IoT for IchigoJam + MixJuice
'IchigoJam BASIC 1.2.1

'G=http get BaseURL
'I=Array Loop Index 
'W=Weather #

NEW

'Weather Update
1 'IoT 1/3
10 CLS
20 G="MJ GET iot.ynoseapps.com/"
30 W=0

'---------------------------------
100 'Get Weather
110 ?G;"weather.php?city=120010&mode=w"
120 INPUT W:?"Weather:";W

200 'Make Weather ICON
210 FOR I=10 TO 17
220  [I]=PEEK(#760+(W-1)*8+(I-10))
230 NEXT

300 LRUN 2:'Sensor Update

SAVE 1
