#Bubble sort
.data 
	a: .word 7, 5, 1, 5,6,7,3,6,8,8,13,5
	n: .word 12 
	space: .asciiz " "

.text 
main:
	la $t1, a #1st element memory address
	lw $s0, n # array length s0 =n=13
	subu $s0, $s0 , 1 # s0= n-1
	addu $s5, $0, $0 # swapped =0
	addu $s1, $0 , $0	#s1=i=0
for1:
	addu $s2, $0,$0	#s2=j=0
	
	subu $t9, $s0, $s1 	#t9= n-1-i
	for2:
		add $t2, $t1, 4 #next element memory address
		lw $t4, ($t1)	#a[j]
		lw $t5, ($t2)	#a[j+1]
		
		ble $t4, $t5, notSwap #a[j] <=a[j+1] then notswap
		
		sw $t4, ($t2)	#a[j] =a[j+1]
		sw $t5, ($t1)	#a[j+1]= a[j]
		
		addu $s5, $0,1 #swapped =1
		notSwap:
		
		beq $s2,$t9, endFor2 #if j=n-i-1, endFor2
		addu $s2,$s2, 1 #j++
		add $t1, $t1, 4 # next element memory address for j
		add $t2, $t2 , 4 #next element memory address for j+1
		b for2 #j<n-i-1 then for2
	 endFor2:
	 
	 beqz $s5, endFor1
	 beq $s1, $s0, endFor1 #i=n-1 then endFor1
	 addu $s1, $s1, 1 #i++
	 la $t1, a #first element memory address
	 b for1
endFor1:

la  $t1, a #1st element memory address
#add $s1, $0, $0
and $s1, $zero, $zero
print:
	#li $v0, 1
	#lw $a0, ($t1)
	#syscall
	
	lw $a0, ($t1)
	addu $v0, $zero,1
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	#bgt  $s1,$s0,endPrint
	#bgt $s1, $s0, endPrint	#i>n-1 then end print
	addu $s1,$s1, 1
	addu $t1, $t1, 4
	b print 	#i<n-1 goto print
endPrint:		
		
		
		
		
		
		
		
		
		
