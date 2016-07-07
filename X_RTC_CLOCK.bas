1 'RTC
10 cls:gosub800
100 lc0,0:poke#700,0
110 ifi2cr(#68,#700,1,#701,7)?"E"
120 A=#707:gosub700:?"/";
130 A=#706:gosub700:?"/";
140 A=#705:gosub700:?
150 A=#703:gosub700:?":";
160 A=#702:gosub700:?":";
170 A=#701:gosub700:?
180 gosub800:gosub950
190 goto100
700 'PRINT
710 S=peek(A)
720 ifA=#701letS,S&#7F
730 ifA=#702letS,S&#7F
740 S=S/16*10+S%16:ifS<10?"0";
750 printS;:return
800 'LCD INIT
810 poke#700,64,0,2,#C0,57,17,#70,86,#6C,56,12
820 ifi2cw(62,#701,1,#704,5)?"E"
830 wait12
840 ifi2cw(62,#701,1,#709,2)?"E"
900 'LCD OUT
910 ifi2cw(62,#701,1,#702,1)+i2cw(62,#700,1,#900,8)+i2cw(62,#701,1,#703,1)+i2cw(62,#700,1,#920,8)?"E"
920 return
950 'TV OUT
960 let[0],#80,#8A,#85,#8F:lc0,4:forY=0to15:forX=0to7
970 C=peek(vpeek(X,Y/8)*8+Y%8):?chr$([C>>6&3],[C>>4&3],[C>>2&3],[C&3]);
980 next:next:return
