#assignment 4 . Case i>=j
.text
	addi $s1, $zero, 8	#i=8
	addi $s2, $zero, 9	#j=9
	addi $t1, $zero, 8	#x=8
	addi $t2, $zero, 9 	#y=9
	addi $t3, $zero, 3	#z=3
start:
	slt $t0, $s1, $s2	#i<j
	bne $t0, $zero, else #goto Else if t0!=0<=> t0=1 <=> i<j
	addi $t1, $t1, 1	#part x=x+1
	addi $t3, $zero, 1  #init z=1
	j endif		#skip the else part
else: 	addi $t2, $t2, -1	#part y=y-1
	add $t3, $t3, $t3	#part z=2*z
endif:
	
