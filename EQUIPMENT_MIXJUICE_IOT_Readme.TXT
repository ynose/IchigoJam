'A=I2C Memory Address
'C=I2C MatrixLED Address
'D=I2C MatrixLED Command
'E=I2C TempSensor Address
'F=I2C TempSensor Command
'M=Display MatrixLED Address #800=[0]

'G=http get BaseURL
'I=Array Loop Index 
'W=Weather #

'T=Temperature
'A=Number [A|*]
'B=Number [*|B]
'J=JINKAN Sensor Value

'N=Weather Update Minute
'O=Sensor Update Minute
'V=VIDEO
'S=Bit Shift
'L=Bit Shift Left ArrayIndex
'R=Bit Shift Right ArrayIndex

'------------------------------------------------
'ICON
#700 : 0
#708 : 1
#710 : 2
#718 : 3
#720 : 4
#728 : 5
#730 : 6
#738 : 7
#740 : 8
#748 : 0
#750 : -
#758 : +
#760 : Sun
#768 : Cloud
#770 : Rain
#778 : (Snow)
#780 : I2C MatrixLED Command
#788 
#790 : I2C TempSensor Command
#798 
#7A0 
#7A8 
#7B0 
#7B8 
#7C0 
#7C8 
#7D0 
#7D8 
#7E0 
#7E8 
#7F0 
#7F8 

'------------------------------------------------
'Array [0..101]
'[0......7] #800 - 80E : Screen of MatrixLED
'[8..9]     #810 - 812 : TempSensor raw value

'[10....17] #814 - 824 : Weather ICON for MatrixLED

'[30....37] #83C - 84A : Temperature Number for MatrixLED

[0]		#800
[1]		#802
[2]		#804
[3]		#806
[4]		#808
[5]		#80A
[6]		#80C
[7]		#80E
[8]		#810
[9]		#812
[10]	#814
[11]	#816
[12]	#818
[13]	#81A
[14]	#81C
[15]	#81E
[16]	#820
[17]	#822
[18]	#824
[19]	#826
[20]	#828
[21]	#82A
[22]	#82C
[23]	#82E
[24]	#830
[25]	#832
[26]	#834
[27]	#836
[28]	#838
[29]	#83A
[30]	#83C
[31]	#83E
[32]	#840
[33]	#842
[34]	#844
[35]	#846
[36]	#848
[37]	#84A
[38]	#84C
[39]	#84E
[40]	#850
[41]	#852
[42]	#854
[43]	#856
[44]	#858
[45]	#85A
[46]	#85C
[47]	#85E
[48]	#860
[49]	#862
[50]	#864
[51]	#866
[52]	#868
[53]	#86A
[54]	#86C
[55]	#86E
[56]	#870
[57]	#872
[58]	#874
[59]	#876
[60]	#878
[61]	#87A
[62]	#87C
[63]	#87E
[64]	#880
[65]	#882
[66]	#884
[67]	#886
[68]	#888
[69]	#88A
[70]	#88C
[71]	#88E
[72]	#890
[73]	#892
[74]	#894
[75]	#896
[76]	#898
[77]	#89A
[78]	#89C
[79]	#89E
[80]	#8A0
[81]	#8A2
[82]	#8A4
[83]	#8A6
[84]	#8A8
[85]	#8AA
[86]	#8AC
[87]	#8AE
[88]	#8B0
[89]	#8B2
[90]	#8B4
[91]	#8B6
[92]	#8B8
[93]	#8BA
[94]	#8BC
[95]	#8BE
[96]	#8C0
[97]	#8C2
[98]	#8C4
[99]	#8C6
[100]	#8C8
[101]	#8CA
