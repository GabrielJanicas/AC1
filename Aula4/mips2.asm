# Mapa de registos
# num:	$t0
# p:	$t1
# *p:	$t2

	.data
	.eqv	read_string,8
	.eqv	print_int10,1
	.eqv	SIZE,20
str:	.space 20
	.text
	.globl main

main:	la $a0,str
	li $t0,0
	li $a1,SIZE
	li $v0,read_string
	syscall
	
	la $t1,str

while:	
	lb $t2,0($t1)
	bne $t4,'\0',endw

if:	bge	$t4,'0',endif
	ble	$t4,'9',endif
	addi	$t0,$t0,1
	
endif:	
	addiu $t1,$t1,1
	j while
endw:	move $a0,$t0
	li $v0,print_int10
	syscall
	jr $ra	