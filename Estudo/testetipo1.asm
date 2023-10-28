#Mapa de registos
#val: $t0
#n:   $t1
#min: $t2
#max: $t3

	.data
	.eqv print_string,4
	.eqv read_int,5
	.eqv print_int10,1
	.eqv print_char,11
	
string: .asciiz "Digite ate 20 inteiros (zero para terminar): "
string2: .asciiz "Maximo/minimo sao: "
string3: .asciiz ":"
	
	.text
	.globl main

main:	li $t1,0
	li $t2,0x7fffffff
	li $t3,0x80000000
	
	li $v0,print_string
	la $a0,string
	syscall

do:	li $v0,read_int
	syscall
	move $t0,$v0

if:	beq $t0,0,endif

if1:	ble $t0,$t3,if2
	move $t3,$t0

if2:	bge $t0,$t2,endif
	move $t2,$t0

endif:	addi $t1,$t1,1

while:	bge $t1,20,enddo
	bne $t0,0,do

enddo:	li $v0,print_string
	la $a0,string2
	syscall
	li $v0,print_int10
	move $a0,$t3
	syscall
	li $v0,print_char
	li $a0,':'
	syscall
	li $v0,print_int10
	move $a0,$t2
	syscall

	jr $ra

	
	