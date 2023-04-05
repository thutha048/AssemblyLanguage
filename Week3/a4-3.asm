#assignment 4 . Case i+j<=0
.text
	addi $s1, $zero, 8	#i=8
	addi $s2, $zero, 9	#j=9
	addi $t1, $zero, 8	#x=8
	addi $t2, $zero, 9 	#y=9
	addi $t3, $zero, 3	#z=3
	add $s4, $s2, $s1	#sum=s4=i+j
start:
	slt $t0, $zero, $s4	# 0< i+j
	bne $t0, $zero, else #goto Else if t0!=0<=> t0=1 <=> 0< i+j
	addi $t1, $t1, 1	#part x=x+1
	addi $t3, $zero, 1  #init z=1
	j endif		#skip the else part
else: 	addi $t2, $t2, -1	# y=y-1
	add $t3, $t3, $t3	# z=2*z
endif:
	
