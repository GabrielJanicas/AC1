typedef struct
{
	unsigned int id_number;
	char first_name[18];
	char last_name[15];
	float grade;
} student;

int main(void)
{
	// define e inicializa a estrutura "stg" no segmento de dados
	static student stg = {72343, "Napoleao", "Bonaparte", 5.1};
	print_string("\nN. Mec: ");
	print_intu10(stg.id_number);
	print_string("\nNome: ");
	print_string(stg.last_name);
	print_char(',');
	print_string(stg.first_name);
	print_string("\nNota: ");
	print_float(stg.grade);
	return 0;
}

	.data
	.eqv of_id
	.eqv print_ui10
	.eqv print_string
	.eqv print_chr
	.eqv print_float
	.eqv of_gr,40
	.eqv of_fn
	
	.align 2

stg:	.word 72343
	.asciiz "Napoleao"
	.space 9
	.asciiz "Bonaparte"
	.space 5
	.align 2
	.float 5.1

str1:	.asciiz "\nN . Mec: "
str2:	.asciiz "\nNome: "
str3:	.asciiz "\nNota: "


main:
	la $a0,stg
	li $v0,print_string
	syscall
	la $t0,stg
	lw $a0,of_id($t0)
	li $v0,print_ui10
	syscall
	la $a0,stg
	addiu $a0,$a0,of_in
	li $v0,print_string
	syscall
	li $a0,','
	li $v0,print_chr
	syscall
	la $a0,stg
	addiu $a0,$a0,of_fn
	li $v0,print_string
	syscall
	la $a0,str3
	li $v0,print_string
	syscall
	la $t0,stg
	l.s $f12,of_gr($t0)
	li $v0,print_float

 
  
   
    
     
      
       
        
         
          
           
            
             
              
               
                
                 
                  
                    
	