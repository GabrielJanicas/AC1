#Mapa de Registos
#i:	$t0
#max1:	$t1
#max2:	$t2

	.data 
	.eqv SIZE,5

ListaA: .word 5, 27, 3, 11, 56 

	.text
	.globl main

main:	li $t1,1
	sll $t1,$t1,31      	#max 1 = 1<<31
	move $t2,$t1	  	#max2=max1
	li $t0,0		#i=0
	
for:	bge $t0,SIZE,end 	#while i < SIZE
	
if:	la $t4,ListaA	 	#$t4 = &ListaA[0] 
	sll $t0,$t0,2
	addu $t5,$t4,$t0 	#$t5= &ListaA[i]
	lw $t3,0($t5)		#$t3 = 	ListaA[i]
	ble $t3,$t1,else 	#array[i] > max1
	move $t2,$t1
	move $t1,$t3
	j endif

else:	

if1:	la $t4,ListaA		 #$t4 = &ListaA[0] 
	sll $t0,$t0,2
	addu $t5,$t4,$t0	 #$t5= &ListaA[i]
	lw $t3,0($t5)		#$t3 = 	ListaA[i]
	ble $t3,$t2,endif 	#array[i] > max2
	bge $t3,$t1,endif 	#array[i] < max1
	
	move $t2,$t3

endif: addi $t0,$t0,1
	j for

end: jr $ra
	