#Laboratory Ex2, Assignment 5
.text
	#Assign X, Y
	addi	$t1, $zero, 4
	addi	$t2, $zero, 5
	#Expression Z= 3*xy
	mul	$s0, $t1, $t2	#HI -LO =$t1*$t2 =X*Y , $s0=LO
	mul 	$s0, $s0, 3	#$s0 = $s0 *3 = 3*X*Y
	#Z'= Z
	mflo	$s1    #Move from LO register