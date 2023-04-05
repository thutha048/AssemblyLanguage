.data
	mess1: .asciiz "The digit degree of "
	mess2: .ascii " is "
.text
init:
	addi $a2,$0, 91	 #a2 = n
	add $t0,$0, $a2	 #t0=a2=n
	addi $t1,$0, 0 	#result=t0 = 0
digitDegree:
	bge $t0, 10, sumA #if n >=10 then sumA else endLoop, res=a3=0
whileDigit:
	addi $t0,$t2,0	# n = sumA
	addi $t1,$t1,1	#result++
	bge $t0,10,sumA	#if n>=10 then sumA
	nop
	j endloop

sumA:	
	addi $t2, $0, 0 # sumA= t2 =0
	bgt $t0 ,$0, while #if n >0 then while
while: 
	addi $t3, $0, 10  # t3=10
	div $t0, $t3 
	mfhi $t4  # t4 = n mod 10
	add  $t2, $t2, $t4 #sumA = sumA + (n mod 10)
	div $t0, $t0, $t3 #n =n /10
	bgt $t0, $0,while #if n>0 then while
	j whileDigit
endloop:
print: 
	#print mess1
	li $v0, 4
	la $a0, mess1
	syscall
	#print n
	li $v0,1
	add $a0, $0, $a2
	syscall
	#print mess2
	li $v0, 4
	la $a0, mess2
	syscall
	#print result
	li $v0,1
	add $a0, $0, $t1
	syscall
