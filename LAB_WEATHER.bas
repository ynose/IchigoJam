'SUN   1042183dbc184208
'CLOUD 0030484681817e00
'RAIN  18244281ff101408

10 'request weather data from Arduino
20 POKE #700,0,0
30 R=I2CR(#10,#700,2,#702,4)
40 ?R
50 FOR I=0 TO 3
60 ?HEX$(PEEK(#702+I),2)
70 NEXT
80 END
