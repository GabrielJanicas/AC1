#Mapa de registos
#num: $t0
#i: $t1
#order: $t2

	.data
	.eqv print_string,4
	.eqv read_int,5
	.eqv print_int10,1

string:	.asciiz "Enter a number: "
string2: .asciiz "No set bits\n"

	.text
	.globl main

main:	li $t2,-1
	
	li $v0,print_string
	la $a0,string
	syscall			#print (Enter a numerber)
	
	li $t1,0		#i=0
	
	li $v0,read_int	
	syscall
	move $t0,$v0		#num = read_int
	
do:	
if:	andi $t3,$t0,1
	bne $t3,1,endif
	
	move $t2,$t1

endif:	srl $t0,$t0,1
	addi $t1,$t1,1

while:	blt $t1,32,do

if1: 	beq $t2,-1,else

	li $v0,print_int10
	move $a0,$t2
	syscall
	
	j endwhile
	
else:	li $v0,print_string
	la $a0,string2
	syscall
	

endwhile: jr $ra
	
	
	
