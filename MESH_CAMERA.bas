1 'MESH���
10 CLS:CLV

20 LC 0,18
30 ?"    �����"
40 ?"    �� ��"
50 ?" �� �   � �����         ��"
60 ?"�  ��� �� �� ��        �  �"
70 ?"�����   � �   �  �� �� ���� ��"
80 ?" �� �  � �  �  �� ��  ��  ��"

90 S=RND(3)+1:S=S*60
100 CLT:OUT 0
110 IF TICK()<S CONT
120 U=0:V=RND(20)+5:X=0:Y=RND(15):CLT
130 T=TICK()
140 IF U+V<T X=X+1:U=T
150 IF Z<>X LC Z,Y:?" ";
160 IF X<31 LC X,Y:?"�";
165 WAIT 1
170 IF BTN()=1 LED1:OUT 1,1:WAIT10:OUT 1,0:LED0
180 Z=X
190 IF X<31 GOTO 130 ELSE GOTO 90


