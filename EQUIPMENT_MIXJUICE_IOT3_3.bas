'IoT for IchigoJam + MixJuice
'IchigoJam BASIC 1.2.1

'N=Weather Update Minute(n*60)
'O=Sensor Update Minute(n*60)
'V=VIDEO
'S=Bit Shift
'L=Bit Shift Left ArrayIndex
'R=Bit Shift Right ArrayIndex

NEW

'Main Loop
1 'IoT 3/3

10 'Display On
20 VIDEO 1

100 'Weather ICON
110 COPY M,M+10,16
'110 FOR I=0 TO 7
'120  [I]=[10+I]
'130 NEXT
140 GSB @MLED:WAIT10*60

200 'TempSensor Value
'210 COPY M,M+30,16
'210 FOR I=0 TO 7
'220  [I]=[I+30]
'230 NEXT
'240 GSB @MLED:WAIT10*60
250 L=10:R=30:GSB @MLED_RL:WAIT10*60

300 'Display Off
310 VIDEO V
320 GSB @MLED_OFF

500 @LOOP
520 IF N=>60 N=0:LRUN 1:'Weather Update
510 IF O=>5  O=0:LRUN 2:'Sensor Update
530 IF TICK() > 60*60 N=N+1:O=O+1:CLT
540 WAIT 60:GOTO @LOOP

'Subroutines ---------------------
900 @MLED:'Display to MatrixLED
902 IF I2CW(C,D,1,M,16)?"E" 
903 RTN

910 @MLED_OFF:'Clear MatrixLED
'911 FOR I=0 TO 7
'912  [I]=0
'913 NEXT
911 COPY M,0,16
914 GSB @MLED
915 RTN

920 @MLED_LR:'MatrixLED Scroll O->
921 FOR S=0 TO 7
922  FOR I=0 TO 7
923   [I]=[I+R]>>(1+S)|[I+L]<<(7-S)
924  NEXT
925  GSB @MLED
926  WAIT 5
927 NEXT
928 RTN

930 @MLED_RL:'MatrixLED Scroll <-O 
931 FOR S=0 TO 7
932  FOR I=0 TO 7
933   [I]=[I+L]<<1|[I+R]>>(7-S)
934  NEXT
935  GSB @MLED
936  WAIT 5
937 NEXT
938 RTN

SAVE 3
