1 'MATRIX LED
10 CLS:CLV
20 POKE #700,#21,#81,#E1,#00
30 FOR M=#700 TO #702
40 R=I2CW(#70,M,1,#700,0)
50 NEXT
60 FOR C=#0 TO #FF
70 FOR I=0 TO 7
80 [I]=PEEK(A+I)<<8+PEEK(B+I)
90 LC 12,8+I:?BIN$([I],8)
100 NEXT
110 R=I2CW(#70,#703,1,#800,16)
120 LC 12,5:?HEX$(C,2);
130 WAIT 10
140 A=A+8:B=A
150 NEXT





