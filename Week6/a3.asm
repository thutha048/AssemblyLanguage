#Bubble sort
.data 
A: .word 7, -2, 5, 1, 5,6,7,3,6,8,8,59,5 
Aend: .word  #?? l?y ?.ch? c?a pt cu?i

.text 
main: 	
	la $a0,A #$a0 = Address(A[0])
	la $a1,Aend 
	addi $a1,$a1,-4 #$a1 = Address(A[n-1]) 
	j sort #sort
after_sort: 
	li $v0 , 10
	syscall
end_main:
#-----------------------
#$a0: pointer to 1st element in unsorted part
#$a1: pointer to end element in unsorted part
#$t0: temporary place for value of a[j+1]
#$t1: temporary place for value of a[j]
#t3: pointer to a[j+1]
#t4: pointer to a[j]
#------------------------
sort: 
	beq $a0, $a1, done
	j max
after_loop:
	addi $a1, $a1, -4
	j sort
done:
	j after_sort
max:
	addi $t0,$a0,0 	#init next pointer to first
loop:
	beq $t0, $a1, after_loop #if first = last  ,goto after_loop
	addi $t1, $t0,0	#t1 to current element ( a[j])
	addi $t0, $t0, 4	#t0 advance to next element a[j+1]
	lw $t3, 0($t0)	#load a[j+1]  to t3
	lw $t4, 0($t1)	#load a[j] to t4
	slt $t5, $t3,$t4	#a[j+1] < a[j]?
	bne $t5, $zero, swap #if a[j+1] < a[j], swap
	
	j loop
swap: 
	sw $t3, 0($t1)
	sw $t4,0($t0)
	j loop
	
	
