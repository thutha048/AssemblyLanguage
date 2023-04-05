.data
	A: word 20 10 0 -5
.text
	addi $s0 $zero 4	#n =4
	addi $s1 $zero 0	#i=0
	la $s2, A		#store address of A[0]
	lw $s3 0($s2)	#initMax= A[0]
loop:
	slt $t2, $s1, $s0	#$t2= i<n?1:0
	beq $t2, $zero, endloop
	add $t1, $s1, $s1	#$t1=2*$s1
	add $t1, $t1, $t1	#$t1=4*$s1
	add $t1, $t1, $s2	#$t1 store the address of a[i]
	lw $t0, 0($t1)
	
	#NOT DONE