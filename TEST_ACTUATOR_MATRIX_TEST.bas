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

130 WAIT 60
140 FOR I=1 TO 8
150 FOR J=0 TO 7
160 [J]=[J]<<1
170 NEXT
180 R=I2CW(#70,#703,1,#800,16)
190 WAIT 5
200 NEXT

210 A=A+8:B=A
220 NEXT







