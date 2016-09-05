1 'IR Transmission
10 BPS 300
20 PWM 5,1,3
30 UART 1
40 'VIDEO 0
100 K=INKEY()
110 IF K=0  ?CHR$(27,16);"0":'Ã²¼
120 IF K=?? ?CHR$(27,16);"1":'¾ÞÝ¼Ý   
130 IF K=?? ?CHR$(27,16);"2":'Ð·Þ¾Ý¶² 
140 IF K=?? ?CHR$(27,16);"3":'ËÀÞØ¾Ý¶²
150 IF K=?? ?CHR$(27,16);"4":'º³À²    
160 WAIT 10:GOTO 100
