#Mapa de registos
#cc: $t0
#ms: $t1

	.data

string: .asciiz "Teste-Pratico-1"

	.text
	.globl main

main:	la $t1,string		

while:	lb $t0,0($t1)		#cc = *ms
	beq $t0,'\0',endwhile1	#*ms != '\0'

if:	bge $t0,'0',else
	li $t2,'*'
	sb $t2,0($t1)		#*ms = '*'
	j endwhile
	
else:	
if1:	blt $t0,'a',endwhile
	bgt $t0,'z',endwhile
	addi $t0,$t0,-0x20
	sb $t0,0($t1)
	
endwhile: addi $t1,$t1,1
	  j while
	
endwhile1: jr $ra