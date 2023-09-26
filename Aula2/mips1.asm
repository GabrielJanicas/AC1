 	.data
 	.text
	.globl main
	
main: 
 ori $t0,$0,3870
 ori $t1,$0,41956 
 and $t2,$t0,$t1 
 or  $t3,$t0,$t1 
 nor $t4,$t0,$t1
 xor $t5,$t0,$t1
 nor $t2,$t0,$0
 
 
 jr $ra #fim do programa.