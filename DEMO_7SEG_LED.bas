1 'Number Snow
2 CLS:CLV:OUT0

'CLOCK,LATCH,DATA
3 C=5:L=6:D=7

'7Seg LED 0-9 (0=On,1=Off)
4 LET [0],`10000000,`11110011,`01000100,`01000001,`00110011,`00001001,`00001000,`11100011,`00000000,`00000001

'Main loop
10 K=INKEY()
20 IF 48<=K AND K<=58 THEN N=K-48:GOSUB 100 ELSE K=0
30 X=RND(32)
40 LOCATE X,1:PRINT CHR$(K)
50 SCROLL 2
90 WAIT 10:GOTO 10

'7Seg LED On/Off
100 OUT L,0
110 FOR I=0 TO 7
120 OUT C,0
130 OUT D,[N]>>I & 1
140 OUT C,1
150 NEXT
160 OUT L,1
190 RETURN