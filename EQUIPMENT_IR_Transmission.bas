1 'IR Transmission
10 BPS 300
20 PWM 5,1,3
30 UART 1
40 'VIDEO 0
100 K=INKEY()
110 IF K=0  ?CHR$(27,16);"OUT0": 'Ã²¼
120 IF K=30 ?CHR$(27,16);"OUT21":'¾ÞÝ¼Ý   
130 IF K=31 ?CHR$(27,16);"OUT42":'Ð·Þ¾Ý¶² 
140 IF K=28 ?CHR$(27,16);"OUT41":'ËÀÞØ¾Ý¶²
150 IF K=29 ?CHR$(27,16);"OUT22":'º³À²    
160 CLK:WAIT 10:GOTO 100
