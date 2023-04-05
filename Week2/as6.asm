 #Laboratory Ex2, Assignment 6
 .data	#DECLARE VARIABLE
 X: .WORD    5	#Variable X, word type, init value = 5
 Y: .WORD	   -1	#Variable Y, word type, init value = -1
 Z: .WORD		#Variable Z, word type, no init value
 
 .text	#DECLARE INSTRUCTION
 	#Load X,Y to registers
 	la	$t8, X	#get the address of X in Data Segment
 	la 	$t9, Y	#get the address of Y in Data Segment
 	lw	$t1, 0($t8)	#$t1 =X
 	lw	$t2, 0($t9)	#$t2= Y
 	#4($t8) =Y 
 	#Calculate the expression Z= 2X+Y with registers only
 	add 	$s0, $t1, $t1	# $s0 = $t1+ $t1 =X+X= 2X
 	add	$s0, $s0, $t2	# $s0 = $s0+ $t2 = 2X+Y
 	
 	#store result from register to variable Z
 	la	$t7, Z	#get the address of Z in data segment
 	sw	$s0, 0($t7)	#Z= $s0 = 2X+Y