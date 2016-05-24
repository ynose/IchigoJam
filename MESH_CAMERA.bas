1 'MESH¶Ò×
10 CLS:CLV

20 LC 0,18
30 ?"    ‡ƒƒƒ‹"
40 ?"    … Š"
50 ?" ˜™ …   Š ‡ƒƒƒ‹         ˜™"
60 ?"˜  ™… Š … Š        ˜  ™"
70 ?"š‘Š›…   Š …   Š  Ÿž Ÿž š‘Š› Ÿž"
80 ?" Š… …  Š …  Š  …Š …Š  Š…  …Š"

90 S=RND(5)+1:S=S*60
100 CLT:OUT 0
110 IF TICK()<S CONT
120 Y=RND(15)
130 FOR X=1 TO 31
140 LC X,Y:?" ñ";
150 IF INKEY()=32 OUT 1,1:OUT 1,0
160 NEXT
170 LC 31,Y:?" ";
170 GOTO 90
