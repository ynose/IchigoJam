'
'                   :
'                   |
'                  ö õ
'           :
'           |
'          â Ü
'                           :
'                           |
'                          ç é
' 
' 
'  
'   
'   
'      ;;
'        Ôá

1 '¬’
10 CLS:CLV:CLT:M=9

20 LC 0,17
30 ?" "
40 ?" "
50 ?"  "
60 ?"   "
70 ?"   "
80 ?"    "
90 ?"      "

'[0]Depth,[1]LastTick,[2]Top,[3]Left
91 LET [0],19
92 LET [4],16
93 LET [8],13
94 LET [12],19
95 LET [16],16
96 LET [20],13

'MainLoop
100 FOR I=0 TO 2
110 P=3*I+1*I
120 IF [P+1]=0 [P+3]=RND(18)+12:[P+2]=RND([P]/2)*-1+1
130 GOSUB 200
150 NEXT
160 GOTO 100

'Rain
200 S=TICK():T=[P+2]:X=[P+3]
210 IF [P+1]+1<S T=T+1:[P+1]=S
230 IF 0<=T && T<20 LC X,T-2:?" ";:LC X,T-1:?":";:LC X,T:?"|";
240 IF T=[P] [P+1]=0:LC X,T-1:?" ":LC X,T:?" ":LC X-1,T+1:?"â Ü";:WAIT2:LC X-1,T+1:?"   ";
250 [P+2]=T

'Snail
400 IF C+180<S M=M+1:C=S ELSE RETURN
410 IF M>26 LC M,22:?"    ";:LC M,23:?"    ";:M=9:GOTO 440
420 LC M,22:?"  ;;";
430 LC M,23:?" Ôá";
440 RETURN

