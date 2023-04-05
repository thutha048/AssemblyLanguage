#Lab4 assignment 3
#d. ble s1, s2, L
.text
	li $s1, 5
	li $s2, 8
	li $s0, 6 #L=6
	slt $t0,$s2,$s1 # s1>s2:1:0
	beq $t0,1, END
	add $s3, $zero, $s0
END:
	