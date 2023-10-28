# Mapa dos registos
#    i:      $t0
#    v:	     $t1
# &(val[0]): $t2

	.data
str1:	.asciiz "Result is: "
val:	.word 8, 4, 15, -1987, 327, -9, 27, 16
	.eqv SIZE, 8
	.eqv print_int10, 1
	.eqv print_string, 4
	.eqv print_char, 11
	.text
	.globl main
	
main:	li $t0,0
	la $t2,val

do:	sll $t3,$t0,2
	addu $t4,$t3,$t2  #v = &val[i]
			  #$t9 = val[i]
	lw $t9,0($t4)	  #v = val[i]
	move $t1,$t9
	li $t5,SIZE
	srl $t5,$t5,1	  #SIZE/2
	add $t6,$t0,$t5	  #i+SIZE/2
	sll $t6,$t6,2
	addu $t7,$t2,$t6  #$t7 = &val[i+SIZE/2]
	lw $t8,0($t7)	  #$t8 = val[i+SIZE/2]
	sw $t9,0($t8)
	sw $t8,0($t1)
	
while:	addi $t0,$t0,1
	bge $t0,4,do
	
	li $v0, print_string
	la $a0, str1
	syscall			#print_str1
	li $t0, 0		# i=0
	
do2:	sll $t7, $t0, 2		#[i]
	addi $t0, $t0, 1	#[i++]
	addu $t3, $t7, $t2	#val + [i++]
	li $v0, print_int10	
	lw $a0, 0($t3)
	syscall 		#print_int10(val[i++])
	
	li $v0, print_char
	li $a0, ','
	syscall			#print_char(',')
	
	bge $t0, SIZE, enddo2	#end if i>=SIZE
	j do2

enddo2: 
	jr $ra
	
	
	
	
	
	
	
