#assignment 4 . Case i+j >=m+n
.text
	addi $s1, $zero, 8	#i=8
	addi $s2, $zero, 9	#j=9
	addi $s4, $zero, 6	#m=6
	addi $s5, $zero, 7	#n=7
	addi $t1, $zero, 8	#x=8
	addi $t2, $zero, 9 	#y=9
	addi $t3, $zero, 3	#z=3
	add  $s3, $s1, $s2	#sum_1=i+j
	add  $s6, $s4, $s5	#sum_2=m+n
start:
	slt $t0, $s3, $s6	# i+j <m+n
	bne $t0, $zero, else #goto Else if t0!=0<=> t0=1 <=> i+j<m+n
	addi $t1, $t1, 1	#part x=x+1
	addi $t3, $zero, 1  #init z=1
	j endif		#skip the else part
else: 	addi $t2, $t2, -1	#part y=y-1
	add $t3, $t3, $t3	#part z=2*z
endif:
	
