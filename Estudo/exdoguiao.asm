# Mapa de registos
# p:  $t0
# *p: $t1
# lista+Size: $t2

	.data
	.eqv print_string,4
	.eqv SIZE,10
	.eqv print_int10,1
	
lista:	.word 8, -4, 3, 5, 124, -15, 87, 9, 27, 15
string: .asciiz ";"
string2: .asciiz "\nConteudo do array:\n"

	.text
	.globl main

main:	li $v0,print_string
	la $a0,string2
	la $t0,lista		#p=  &lista[0]
	li $t2,SIZE
	sll $t2,$t2,2		
	addu $t2,$t2,$t0 	#$t2= &lista[size]
	
for:	bge $t0,$t2,endfor
	li $v0,print_int10
	lw $t4,0($t0)
	move $a0,$t4
	syscall
	li $v0,print_string
	la $a0,string
	syscall 
	addi $t0,$t0,4
	j for

endfor: jr $ra
	
	
	
	
	

	