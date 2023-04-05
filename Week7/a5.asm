#Lab7. Ex5
.data
	MessMax: .asciiz "The largest value is: "
	MessMin: .asciiz "The smallest value is: "
	MessMaxIndex: .asciiz "The largest element is stored in $s"
	MessMinIndex: .asciiz "The smallest element is stored in $s"
.text
main: 
	li $s0, 7
	li $s1,  6
	li $s2,  8
	li $s3,  9
	li $s4,  5
	li $s5,  4
	li $s6, -3
	li $s7, -5
	jal init 
	nop
	
	# t0 : maxValue, t1 :minValue
	#t8: maxIndex, t9: minIndex
	#print index of max element
	li $v0, 56
	la $a0, MessMax
	add $a1, $t0, $zero
	syscall
	
	la $a0, MessMaxIndex
	add $a1, $t8, $zero
	syscall
	
	
	la $a0, MessMin
	add $a1, $t1, $zero
	syscall
	
	la $a0, MessMinIndex 
	add $a1, $t9, $zero
	syscall
	
	#exit program
	li $v0, 10
	syscall
endmain:
swapMax: 
	add $t0, $t3, $0 #set max = $t3
	add $t8, $t2, $t0 #set index  of Max = $t2
	jr $ra
swapMin: 
	add $t1, $t3, $0 #set min = $t3
	add $t9, $t2, $t0 #set index  of Min = $t2
	jr $ra

init:
	add $fp, $sp, $0
	addi $sp, $sp, -32
	sw $s1, 0($sp)
	sw $s2, 4($sp)
	sw $s3, 8($sp)
	sw $s4, 12($sp)
	sw $s5, 16($sp)
	sw $s6, 20($sp)
	sw $s7, 24($sp)
	sw $ra ,28($sp) #save $ra for main
	
	add $t0, $s0, $0  #set max s0
	add $t1, $s0, $0   #set min s0
 	
	li $t8, 0	#set index of max = 0
	li $t9, 0 #set index of min =0
	li $t2, 0 #set current index =0

find_max_min:
	addi $sp, $sp , 4
	lw $t3, -4($sp)
	sub $t4, $sp, $fp #check if meet $ra
	beq $t4, $0, done # if true then done
	addi $t2, $t2, 1 # index++
	sub $t4, $t0, $t3 # Max- t3
	bltzal $t4, swapMax #if Max < t3 then swap Max
	sub $t4, $t3, $t1 # t3 - Min
	bltzal $t4, swapMin #if t3 < Min then swap Min
	j find_max_min #repeat

done:
	lw $ra, -4($sp) 	#load $ra
	jr $ra 	#retrun to calling program
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
