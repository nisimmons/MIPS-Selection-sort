#Nathaniel Simmons
#This program demonstrates a selection sort on the data in memory.
#Last modified 11/12/2020
.data
array:	.word		19,-2,95,26,83,17,-5,69,-16,10,45,-17,88,27,-13,67,-48,6,-66,40
			19,-2,95,26,83,17,-5,69,-16,10,45,-17,88,27,-13,67,-48,6,-66,40
			19,-2,95,26,83,17,-5,69,-16,10,45,-17,88,27,-13,67,-48,6,-66,40
			19,-2,95,26,83,17,-5,69,-16,10,45,-17,88,27,-13,67,-48,6,-66,40
			19,-2,95,26,83,17,-5,69,-16,10,45,-17,88,27,-13,67,-48,6,-66,40
			19,-2,95,26,83,17,-5,69,-16,10,45,-17,88,27,-13,67,-48,6,-66,40
			19,-2,95,26,83,17,-5,69,-16,10,45,-17,88,27,-13,67,-48,6,-66,40
			19,-2,95,26,83,17,-5,69,-16,10,45,-17,88,27,-13,67,-48,6,-66,40
			19,-2,95,26,83,17,-5,69,-16,10,45,-17,88,27,-13,67,-48,6,-66,40
			19,-2,95,26,83,17,-5,69,-16,10,45,-17,88,27,-13,67,-48,6,-66,40
			19,-2,95,26,83,17,-5,69,-16,10,45,-17,88,27,-13,67,-48,6,-66,40
			19,-2,95,26,83,17,-5,69,-16,10,45,-17,88,27,-13,67,-48,6,-66,40
			19,-2,95,26,83,17,-5,69,-16,10,45,-17,88,27,-13,67,-48,6,-66,40
			19,-2,95,26,83,17,-5,69,-16,10,45,-17,88,27,-13,67,-48,6,-66,40
			19,-2,95,26,83,17,-5,69,-16,10,45,-17,88,27,-13,67,-48,6,-66,40
			19,-2,95,26,83,17,-5,69,-16,10,45,-17,88,27,-13,67,-48,6,-66,40
			19,-2,95,26,83,17,-5,69,-16,10,45,-17,88,27,-13,67,-48,6,-66,40
			19,-2,95,26,83,17,-5,69,-16,10,45,-17,88,27,-13,67,-48,6,-66,40
			19,-2,95,26,83,17,-5,69,-16,10,45,-17,88,27,-13,67,-48,6,-66,40
			19,-2,95,26,83,17,-5,69,-16,10,45,-17,88,27,-13,67,-48,6,-66,40
			19,-2,95,26,83,17,-5,69,-16,10,45,-17,88,27,-13,67,-48,6,-66,40
			19,-2,95,26,83,17,-5,69,-16,10,45,-17,88,27,-13,67,-48,6,-66,40
			19,-2,95,26,83,17,-5,69,-16,10,45,-17,88,27,-13,67,-48,6,-66,40
			19,-2,95,26,83,17,-5,69,-16,10,45,-17,88,27,-13,67,-48,6,-66,40
			19,-2,95,26,83,17,-5,69,-16,10,45,-17,88,27,-13,67,-48,6,-66,40
len:	.word		500
.text
main:
	la	$a0, array		#sort the array
	lw	$a1, len
	jal 	sort
	j	exit

####################
sort:
	#a0 is array, a1 is length
	addi	$t0, $0, 0		#outer counter
	addi	$t1, $0, 0		#current
	addi	$t2, $0, 0		#other item value
	la	$t3, ($a0)
	addi	$t4, $0, 0		#inner loop counter
	addi	$t5, $0, 0		#t5 and t6 hold values while swapping occurs
	addi	$t6, $0, 0
	addi	$s1, $0, 0		#s1, s2 are address 1, 2
	addi	$s2, $0, 0
S1:
	beq	$t0, $a1, S4		#jump out if we are at the end of the loop
	lw	$t1, ($t3)		#t1 has current item value
	addi	$t0, $t0, 1		#increment i
	move	$s1, $t3		
	addi	$t3, $t3, 4		#increment address to next word
	move	$t4, $t0
	move	$t2, $t1		#this area just sets up for the swapping
	move	$t5, $t3
	move	$s2, $s1
	j	S2
S2:	
					#t4 is counter, s1 is address of value 1. t5 will hold the current address, t6 will hold the current value
	beq	$t4, $a1, S3		#iterate until the end of the array
	addi	$t4, $t4, 1		#increment counter
	lw	$t6, ($t5)		#load value to t6
	addi	$t5, $t5, 4		#increment address to next word
	blt	$t6, $t2, set		#if the value is less than the value we are checking it against, set s2 to that address
	j	S2
set:
	move	$t2, $t6		#this mainly sets s2 to the address of t5, which is the value currently looked at in S2
	addi	$s2, $t5, -4
	j	S2
S3:	
	sw	$t1, ($s2)		#swap t1 and t2 values
	sw	$t2, ($s1)
	j	S1
S4:	
	jr	$ra			#return
	
####################
exit:
	li 	$v0, 10
	syscall 
