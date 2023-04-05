#Lab 5. Assignment 2
.data  
	mess1: .asciiz "The sum of "
	mess2: .asciiz " and "
	mess3: .asciiz " is "
.text
	addi $s0, $zero, 5
	addi $s1, $zero ,4
	#print mess1
	li $v0 , 4 
	la $a0, mess1
	syscall
	#print num1
	li $v0, 1
	add $a0,$zero, $s0
	syscall
	#print mess2
	li $v0 , 4
	la $a0, mess2
	syscall
	#print num2
	li $v0, 1
	add $a0, $zero, $s1
	syscall
	#print mess3
	li $v0 , 4
	la $a0, mess3
	syscall
	#print num3
	li $v0 , 1
	add $a0, $s0, $s1
	syscall
	
