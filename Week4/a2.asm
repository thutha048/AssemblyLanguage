#Laboratory Exercise 4, Assignment 2 
.text 
	li $s0, 0x12345678 #load test value for these function 
	andi $t0, $s0, 0xff000000	 #Extract the MSB of $s0
	srl  $t1, $t0, 24
	andi $t2, $s0 , 0xffffff00	  #Clear LSB of $s0
	ori $t3, $s0, 0x000000ff	#set LSB of $s0
	and $s0 ,0		#clear $s0