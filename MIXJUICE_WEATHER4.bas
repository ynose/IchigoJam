NEW


' 103 ----------
1 '�ݷ�γ 4/4

' Read ADT7410
100 Z=I2CR(E,F+1,1,#800+16,1)
110 Z=I2CR(E,F,  1,#801+16,1)
120 T=[8]/128
130 ?"��ò�=";[8];" : ����=";T;"�C"

' ADT7410 to LED
200 A=T/10:B=T%10
210 FOR L=0 TO 7
220  [L]=PEEK(#700+B*8+L)
230  IF A>0 [L]=[L]|PEEK(#700+A*8+L)<<4
240 NEXT
250 Z=I2CW(C,D,1,#800,16) 
260 WAIT 60*5

300 LRUN 102

SAVE 103
