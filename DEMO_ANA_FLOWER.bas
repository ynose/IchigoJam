' A=ANA(2) -> Volume

1 'ANA_FLOWER

'Initialize
2 CLS:CLV
3 X=10:Y=10
4 LET [0],2,0,32,2,1,32,5,1,32,4,2,32,5,4,32,6,4,32,4,6,32,5,7,32,2,7,124,2,8,124,0,6,32,-1,7,32,-1,4,32,-2,4,32,0,2,32,-1,1,32

'Initialize Screen
5 FOR I=0 TO 8
6 LOCATE X+2,Y+7+I:?"|"
7 NEXT

'Main loop
10 A=ANA(2)
20 A=A*10:C=A/1023:LC 1,1:?C;" "

' Flower
100 LOCATE X+2,Y+3:IF C>=0 THEN ?"#"   ELSE ?" "
110 LOCATE X+1,Y+4:IF C>=0 THEN ?"#*#" ELSE ?"   "
120 LOCATE X+2,Y+5:IF C>=0 THEN ?"#"   ELSE ?" "

200 LOCATE X+2,Y+2:IF C>0 THEN ?"#"     ELSE ?" "
210 LOCATE X+1,Y+3:IF C>0 THEN ?"###"   ELSE ?" # "
220 LOCATE X  ,Y+4:IF C>0 THEN ?"##*##" ELSE ?" #*# "
230 LOCATE X+1,Y+5:IF C>0 THEN ?"###"   ELSE ?" # "
240 LOCATE X+2,Y+6:IF C>0 THEN ?"#"     ELSE ?"|"

310 FOR I=1 TO 16 STEP 2
320 J=(I-1)*3
330 LOCATE X+[J],Y+[J+1]:IF C>I/2+1 THEN ?"�" ELSE ?CHR$([J+2])
340 J=(I-1)*3+3
350 LOCATE X+[J],Y+[J+1]:IF C>I/2+1 THEN ?"�" ELSE ?CHR$([J+2])
360 NEXT

999 WAIT 10:GOTO 10
