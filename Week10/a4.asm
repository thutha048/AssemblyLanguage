.eqv KEY_CODE 0xFFFF0004 # ASCII code from keyboard, 1 byte
.eqv KEY_READY 0xFFFF0000 # =1 if has a new keycode ? # Auto clear after lw
.eqv DISPLAY_CODE 0xFFFF000C # ASCII code to show, 1 byte
.eqv DISPLAY_READY 0xFFFF0008 # =1 if the display has already to do # Auto clear after sw
.eqv e 0x65
.eqv x 0x78
.eqv i 0x69
.eqv t 0x74

.text
	li $k0, KEY_CODE
	li $k1, KEY_READY
	li $s0, DISPLAY_CODE
	li $s1, DISPLAY_READY
Loop: 	nop
WaitForKey: 
	lw $t1, 0($k1) # $t1 = [$k1] = KEY_READY
	nop
	beq $t1, $zero, WaitForKey # if $t1 == 0 then Polling
	nop
#-----------------------------------------------------
ReadKey: 	lw $t0, 0($k0) # $t0 = [$k0] = KEY_CODE
	j Check_e
	nop
#-----------------------------------------------------
WaitForDis: 
	lw $t2, 0($s1) # $t2 = [$s1] = DISPLAY_READY
	nop
	beq $t2, $zero, WaitForDis # if $t2 == 0 then Polling
	nop
#-----------------------------------------------------
#Encrypt: 	addi $t0, $t0, 1 # change input key (For example in pdf, each character output will increase 1)
#-----------------------------------------------------
ShowKey: 	sw $t0, 0($s0) # show key
	nop
	j Loop
#-----------------------------------------------------
Check_e:
	beq $t3, e, Check_x		#if character e exist then check x
	bne $t0,e, WaitForDis	#if != e then continue 
	add $t3, $t0, $0
	j WaitForDis

Check_x:
	beq $t4, x, Check_i		
	bne $t0, x, Reset
	add $t4, $t0, $0
	j WaitForDis
	
Check_i:
	beq $t5, i, Check_t
	bne $t0, i, Reset
	add $t5, $t0, $0
	j WaitForDis

Check_t:
	beq $t0, t, Exit		#if t exist then exit
	j Reset			#if not then continue
Reset:
	li $t3,0			#reset 'e' to 0
	li $t4,0			#reset 'x' to 0
	li $t5,0			#reset 't' to 0
	j WaitForDis
Exit: 
	li $v0, 10
	syscall
	j Loop
	nop
