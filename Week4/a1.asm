#Laboratory Exercise 4, Assignment 1 .Ktra tran bit khi cong 2 so dau
.text 
	addi $s1, $zero,0xbfffffff
	addi $s2, $zero, 0xbfffffff
start: 
	li $t0,0 #No Overflow is default status
	addu $s3,$s1,$s2 # s3 = s1 + s2 
	xor $t1,$s1,$s2 #Test if $s1 and $s2 have the same sign 	
	
	bltz $t1,EXIT #If not, exit . If t1<0 (s1, s2 trai dau) then EXIT
	nop
	slt $t2,$s3,$s1  #so sánh s3 v?i s1
	bltz $s1,NEGATIVE #Test if $s1 and $s2 is negative? 
	beq $t2,$zero,EXIT #s1 and $s2 are positive 
		# if $s3 > $s1 then the result is not overflow 
	j OVERFLOW 
NEGATIVE: 
	bne $t2,$zero,EXIT #s1 and $s2 are negative 
	# if $s3 < $s1 then the result is not overflow 
OVERFLOW: 
	li $t0,1 #the result is overflow 
EXIT:
