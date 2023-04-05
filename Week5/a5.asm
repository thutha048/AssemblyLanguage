#Assignment 5. Lab5
.data 
	string: .space 20
.text
initial:
	add $s0, $zero, $zero
input:
	li $v0, 12
	la $s1,string
	syscall
	nop
check:
	beq $v0, 10, print 
	add $t1, $s0, $s1 	
	sb $v0, 0($t1) 
	addi $s0, $s0 , 1	
	slti $t0, $s0, 20
	beq $t0, $zero, print 
	j input
print:
	slt $t0, $s0, $zero	
	bne $t0, $zero, exit
	add $t1, $s0, $s1	
	lb  $t2, 0($t1)	
	li $v0,11
	add $a0, $zero, $t2	
	syscall
	addi $s0, $s0, -1	
	j print
exit: