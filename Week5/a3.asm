.data 
	x: .space 200
	mess1: .asciiz "Enter string: "
	string: .space 200 
	mess2: .asciiz "String is not  valid"
	mess3: .asciiz "Result of strcpy: "
	mess4: .asciiz "Length of string: " 
.text
main: 
get_string: 
	li $v0 , 54
	la $a0, mess1
	la $a1, string
	la $a2, 200
	syscall
check_char: 
	beq $a1, $zero, strcpy
	li $v0, 59
	la $a0 , mess2
	syscall 
	j exit


strcpy:
	la $a1, string
	la $a0, x
	add $s0, $zero,$zero

loop:
	add $t1, $s0, $a1
	lb $t2, 0($t1)
	add $t3, $s0, $a0
	sb $t2, 0($t3)
	beq $t2, $zero, end 	#if y[i]==0 ->end
	nop
	addi $s0, $s0, 1
	j loop
	nop
print_length: 
end:

	li $v0, 59
	add $a1, $a0 , $zero
	la $a0 , mess3
	syscall
	
	li $v0 ,56
	la $a0, mess4
	subi $a1, $s0,1
	syscall
exit:

	
 
