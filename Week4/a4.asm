#Lab 4. Assignment 4.
.text
start:
	li $t0, 0	#No overflow is default status
	li $s1, 0xbfffffff
	li $s2, 0xbffffffe
	addu $s3, $s1, $s2 
	xor  $t1, $s1, $s2 #Test if s1 and s2 are the same sign
	bltz $t1, EXIT  #if t1<0 ( trai dau), EXIT
	
	xor $t2,$s3,$s1	#Test if s3 and s1 and s2 are the same sign
	bgtz $t2, EXIT	#if t2>0 (cung dau) ,then EXIT
	j OVERFLOW
OVERFLOW:
	li $t0,1	#Overflow	
EXIT:
