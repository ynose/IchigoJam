' [0]Interval,[1]LastTick,[2]Top,[3]Left
' P People

1 'PEOPLE
10 CLS:CLV:CLT:M=26

20 LC 0,5
30 ?"    �����"
40 ?"    �� ��"
50 ?" �� �   � �����         ��"
60 ?"�  ��� �� �� ��        �  �"
70 ?"�����   � �   �  �� �� ���� ��"
80 ?" �� �  � �  �  �� ��  ��  ��"

90 FOR I=0 TO 31
100 LC I,21:?"�"
110 NEXT

120 LET [0],60,0,0,0
130 LET [4],50,0,0,0
140 LET [8],70,0,0,0
150 LET [12],80,0,0,0
160 LET [16],10,0,0,0
170 LET [20],60,0,0,0

'MainLoop
180 FOR I=0 TO 5
190 P=3*I+1*I
200 IF [P+1]=0 [P+2]=RND(8)+12:[P+3]=RND([P]/2)+1:[P+3]=[P+3]*-1
210 GOSUB 250:WAIT 1
220 GOSUB 320:WAIT 1
230 NEXT
240 GOTO 180

'Walk
250 S=TICK():L=[P+3]
260 IF [P+1]+[P]<S L=L+1:[P+1]=S
270 IF [P+3]<>L && 0<L LC [P+3],[P+2]:?" ";
280 IF 0<=L && L<31 LC L,[P+2]:?"�";
290 IF L=31 [P+1]=0
300 [P+3]=L
310 RETURN

'Cloud
320 S=TICK()
330 IF C+3*60<S M=M-1:C=S
340 IF M<0 LC M,1:?"      ";:LC M,2:?"      ";:LC M,3:?"      ";:M=26:GOTO 380
350 LC M,1:?" ��   ";
360 LC M,2:?"� ��� ";
370 LC M,3:?"����� ";
380 RETURN
