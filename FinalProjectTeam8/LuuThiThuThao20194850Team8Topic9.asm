.data
	String1: .asciiz  "                                           *************  \n"
	String2: .asciiz  "**************                            *3333333333333* \n"
	String3: .asciiz  "*222222222222222*                         *33333********  \n"
	String4: .asciiz  "*22222******222222*                       *33333*         \n"
	String5: .asciiz  "*22222*     *222222*                      *33333********  \n"
	String6: .asciiz  "*22222*       *22222*      *************  *3333333333333* \n"
	String7: .asciiz  "*22222*       *22222*    **11111*****111* *33333********  \n"
	String8: .asciiz  "*22222*       *22222*  **1111**       **  *33333*         \n"
	String9: .asciiz  "*22222*      *222222*  *1111*             *33333********  \n"
	String10: .asciiz "*22222*******222222*  *11111*             *3333333333333* \n"
	String11: .asciiz "*2222222222222222*    *11111*              *************  \n"
	String12: .asciiz "***************       *11111*                             \n"			        
	String13: .asciiz "      ---              *1111**                            \n"
	String14: .asciiz "    ( o o )             *1111****   *****                 \n"
	String15: .asciiz "    (   > )              **111111***111*                  \n"
	String16: .asciiz "     -----                 ***********    dce.hust.edu.vn \n"
	Message0: .asciiz "\n-----------MENU-----------\n"
	C1:	.asciiz "1. Print DCE\n"
	C2:	.asciiz "2. Print DCE With Only Border\n"
	C3:	.asciiz "3. Change Position Of Word\n"
	C4:	.asciiz "4. Change Color\n"
	C5:	.asciiz "5. Exit\n"
	C6: 	.asciiz "6.Delete border"
	Input:	.asciiz "Your choice: "
	D:	.asciiz "Enter Color For D(0->9): "
	C:	.asciiz "Enter Color For C(0->9): "
	E:	.asciiz "Enter Color For E(0->9): "
	Error:	.asciiz "Error! Enter again!\n"
.text
	li $t6 50 # current color of D(2)
	li $t7 49 # current color of C(1)
	li $t8 51 # current color of E(3)
main:
	#Print menu
	la $a0, Message0	
	li $v0, 4
	syscall
	
	la $a0, C1	
	li $v0, 4
	syscall
	la $a0, C2	
	li $v0, 4
	syscall
	la $a0, C3	
	li $v0, 4
	syscall
	la $a0, C4	
	li $v0, 4
	syscall
	la $a0, C5	
	li $v0, 4
	syscall
	
	la $a0, C6
	li $v0, 4
	syscall
	
	la $a0, Input	
	li $v0, 4
	syscall
	li $v0, 5	#enter choice
	syscall
	
	Case1:
		addi $v1, $0, 1
		bne $v0, $v1, Case2
		j Menu1
	Case2:
		addi $v1, $0, 2
		bne $v0, $v1, Case3
		j Menu2
	Case3:
		addi $v1, $0, 3
		bne $v0, $v1, Case4
		j Menu3
	Case4:
		addi $v1, $0, 4
		bne $v0, $v1, Case5
		j Menu4
	Case6: 
		addi $v1,$0,6
		bne $v0,$v1,Case6
	Case5:
		addi $v1, $0, 5
		bne $v0, $v1, defaultmenu
		j Exit
	defaultmenu:
		la $a0, Error	
		li $v0, 4
		syscall
		j main
#---------Case1:Print DCE
Menu1:	
	addi $t0, $0, 0	#bien dem i=0
	addi $t1, $0, 16	#string: n=16
	
	la $a0,String1	#a0 = address of String1
	
Loop:	beq $t1, $t0, main	
	li $v0, 4
	syscall
		
	addi $a0, $a0, 60 #  string :60 char
	addi $t0, $t0, 1
	j Loop
#--------Case2 Print DCE With Only Border
Menu2: 	addi $s0, $0, 0	#row i=0
	addi $s1, $0, 16	#n=16
	la $s2,String1	
		
Loop2:	beq $s1, $s0, main
	addi $t0, $0, 0	# $t0=j=0
	addi $t1, $0, 60 # $t1=m=60
	
row:
	beq $t1, $t0, End
	lb $t2, 0($s2)	# $t2 luu gia tri cua tung phan tu trong string1
	
	bgt $t2, 47, Greater0 # $t2 >=0 
	j Print	#if $t2<0->print
	Greater0: 
		bgt $t2, 57, Print #t2>9 ->print
		addi $t2, $0, 0x20 # $t2= space
		j Print	
Print: 	li $v0, 11 # each char
	la $a0,($t2)
	syscall
	addi $s2, $s2, 1 # nextword
	addi $t0, $t0, 1 #i++
	j row
End:	addi $s0, $s0, 1 # j++
	j Loop2

#-------Case3: change position
Menu3:	addi $s0, $0, 0	#row i
	addi $s1, $0, 16
	la $s2,String1 
Loop3:	beq $s1, $s0, main
	#tao thanh 3 string 
	sb $0, 21($s2) #end of D
	sb $0, 41($s2) #end of C
	sb $0, 57($s2) #end of E
	#change posi
	li $v0, 4 
	la $a0, 42($s2) # E
	syscall
	
	li $v0, 4 
	la $a0, 22($s2) # C
	syscall
	
	li $v0, 4 
	la $a0, 0($s2) # D
	syscall
	
	li $v0, 4 
	la $a0 58($s2) #\n
	syscall
	
	# space
	addi $t1, $0, 0x20
	sb $t1, 21($s2)
	sb $t1, 41($s2)
	sb $t1, 57($s2)
	
	addi $s0, $s0, 1
	addi $s2, $s2, 60
	j Loop3

#------Case4 change color-------
Menu4: 
InputColorD:	
	li $v0, 4		
	la $a0, D
	syscall
	li $v0, 5		# input D's color
	syscall
	blt $v0,0, InputColorD # <0 or >9 ->enter again
	bgt $v0,9, InputColorD
		
	addi $s3, $v0, 48	#$s3=color of D
InputColorC:	
	li $v0, 4		
	la $a0, C
	syscall
	li $v0, 5		
	syscall
	blt $v0, 0, InputColorC
	bgt $v0, 9, InputColorC
				
	addi $s4,  $v0, 48	#$s4=C's color
InputColorE:	
	li $v0, 4		
	la $a0, E
	syscall
	li $v0, 5		
	syscall
	blt $v0, 0, InputColorE
	bgt $v0, 9, InputColorE
			
	addi $s5, $v0, 48	#$s5=E's color
	
	addi $s0, $0, 0	#row : i=0
	addi $s1, $0, 16	#numRow n=16
	la $s2,String1	
	li $a1 48 #a1= value0
	li $a2 57 #a2=value 9
LoopChangeColor:	
	beq $s1, $s0, UpdateColor
	addi $t0, $0, 0	# character: $t0=j=0 
	addi $t1, $0, 60 	#t1=m=60
aRow:
	beq $t1, $t0, EndChange
	lb $t2, 0($s2)	# $t2= gia tri cua tung phan tu trong string1
	CheckD:	bgt $t0, 21, CheckC #check xong D ->checkC
		beq $t2, $t6, changeD #ki tu $t2 co mau t5
		j NextChange
	CheckC: 	bgt $t0, 41, CheckE 
		beq $t2, $t7, changeC
		j NextChange
	CheckE: 	beq $t2, $t8, changeE
		j NextChange
		
changeD: 	sb $s3, 0($s2)
	j NextChange
changeC: 	sb $s4, 0($s2)
	j NextChange
changeE: 	sb $s5, 0($s2)
	j NextChange
	
NextChange: 	
	addi $s2, $s2, 1 #sang kt tiep theo
	addi $t0, $t0, 1
	j aRow
EndChange:	
	li $v0, 4  
	addi $a0, $s2, -60 
	syscall
	addi $s0, $s0, 1 # row i++
	j LoopChangeColor
UpdateColor:
	move $t5, $s3
	move $t6, $s4
	move $t7, $s5
	j main	
Exit:
