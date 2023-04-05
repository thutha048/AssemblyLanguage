#Lab 4,  Assignment 3 . 
#a. abs $s0, $s1
.text
	li $s1,5 
	bgtz $s1 , XULI # if s1 > 0 then XULI
	sub $s0, $zero,$s1 #$s0 = 0- $s1 = -$s1
XULI:	
	add $s0, $zero,$s1	#$s0 =$s1
