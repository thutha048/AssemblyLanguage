#Lab3. Assignment 1.3 . Case i>j
.text
	addi $s1, $zero, 1 	#i=1
	addi $s2, $zero, 0	#j=0
start:
	slt	$t0, $s2, $1	#j<i
	bne	$t0, $zero, else	#branch to else if j<i
	addi	$t1, $t1, 1	#then part: x=x+1
	addi	$t3, $zero , 1	#z=1
	j endif			#skip "else" part
else:
	addi $t2, $t2, -1		#begin else part : y=y-1
	add  $t3,$t3,$t3		#z=2*z
endif:
