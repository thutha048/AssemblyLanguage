.data
	mess1: .asciiz "Find prime numbers in a range from N to M"
	Nvalue: .asciiz "Please enter N: "
	Mvalue: .asciiz "Please enter M: "
	output: .asciiz "\nAnswer : \n"
	empty: .asciiz "No prime numbers in this range!\n"
	error: .asciiz "Error! M must be greater than N"
	nextLine: .asciiz "\n"
	space: .asciiz " "
.text
main:
	li $v0, 4       
	la $a0, mess1
	syscall
	
	li $v0, 4
	la $a0, nextLine
	syscall
	
	li $v0, 4
	la $a0, Nvalue
	syscall
	
	li $v0, 5 #read N from keyboard 
	syscall
	move $a1, $v0 # n =a1
	
	li $v0, 4
	la $a0, Mvalue
	syscall
	
	li $v0, 5 #read M from keybard
	syscall
	move $a2, $v0 #m =a2
	
	li $v0, 4
	la $a0, output
	syscall

	j check
check:
	#if m<0 or m<=n then no prime	, if not then do
	blez $a2, printEmpty
	ble $a2,$a1,printError
	j do	

do:
	addi $t0, $a1, 1	#t0= i = n+1
condi:
	blt $t0, $a2, for1 #if i<=m then for1
	nop
	j endLoop
for1:
	ble $t0,1, nextLoopi #if i <=1 (means n<=0) then nextLoopi
	addi $t1,$0,0	#t1= flag=0
	addi $t2, $0,2	#t2= j =2
	div  $t6,$t0,2 	
	mflo $t7		#t7 = t0/2= i/2
condj:	ble $t2,$t7,for2	#if j <= i/2 then for2
	beqz $t1,print	#if flag =0 then print i
	
for2:
	div $t0,$t2
	mfhi $t5		#i mod j = t5
	beqz $t5, dobreak # i mod j =0 then doBreak
	j nextLoopj
dobreak:
	addi $t1,$0,1	#flag =1
	j nextLoopi
nextLoopi:
	addi $t0,$t0,1	#i++
	j condi
nextLoopj:
	addi $t2,$t2,1	#j++
	j condj
print: 
	li $v0,1
	move $a0, $t0	#print i
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	j nextLoopi

printEmpty:
	li $v0,4
	la $a0, empty
	syscall
	nop
	j endLoop
printError:
	li $v0,4
	la $a0,error
	syscall
	nop
	j endLoop
endLoop:
	
	
	

	
	
