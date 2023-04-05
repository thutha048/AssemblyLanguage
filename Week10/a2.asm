.eqv MONITOR_SCREEN 0x10010000 #Dia chi bat dau cua bo nho man hinh 
.eqv GREEN 0x0000FF00 
.text 
	li $k0, MONITOR_SCREEN #Nap dia chi bat dau cua man hinh 
	
	li $t0, 	GREEN
	sw $t0, 0($k0) 
	nop 
	
	li $t0, GREEN 
	sw $t0, 4($k0) 
	nop 
	
	li $t0, GREEN
	sw $t0, 8($k0) 
	nop 
	
	li $t0, GREEN 
	sw $t0, 12($k0)
	nop
	
	li $t0, GREEN 
	sw $t0, 16($k0) 
	nop 
	
	li $t0, GREEN 
	sw $t0, 40($k0) 
	nop 
	
	li $t0, GREEN 
	sw $t0, 72($k0) 
	nop 
	
	li $t0, GREEN 
	sw $t0, 104($k0) 
	nop 
	
	li $t0, GREEN 
	sw $t0, 136($k0) 
	nop 

	