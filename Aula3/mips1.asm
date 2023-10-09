#void main(void)
#{
#	int soma, value, i;
#	for(i=0, soma=0; i < 5; i++)
#	{
#		print_string("Introduza um numero: ");
#		value = read_int();
#			soma = soma + value;
#		else
#			print_string("Valor ignorado\n");
#	}
#	print_string("A soma dos positivos e': ");
#	print_int10(soma);
#}

# Mapa de registos:
# soma: $t0
# value: $t1
# i: $t2
	.data
str1: .asciiz "Introduza um numero: "
str2: .asciiz "Valor ignorado"
str3: .asciiz "A soma dos positivos e: "
	.eqv print_string,4
	.eqv read_int,5
	.text
	.globl main
main: li $t0,0 		# soma = 0;
      li $t2,0
      li $t1,0
      la $a0,str1
      la $a1,str2
      la $a2,str3		 # i = 0;
for: bge $t2,5,endfor   # while(i < 5) {
     ori $v0,$0,print_string
     syscall  		# print_string("...");
     ori $v0,$0,read_int 			# value=read_int();
     syscall
     or $t1,$0,$v0
     
if: ble $t1,$0,else	 # if(value > 0)
     add $t0,$t1,$t0	 # soma += value;
     j endif
else: or $a0,$0,$a1
      ori $v0,$0,print_string
      syscall		 # else
			# print_string("...");
endif: addi $t2,$t2,1 	# i++;
       j for 			# }
endfor:	or $a0,$0,$a2	
	ori $v0,$0,print_string		 # print_string("...");			# print_int10(soma);
	syscall
	or $a0,$0,$t0
	ori $v0,$0,1
	syscall
	
	jr $ra
