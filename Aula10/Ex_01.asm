#---------------------------------------------------------
abs:                    #int abs(int val){
    	move $v0,$a0
abs_if:
    	bge $v0,$0,abs_endif        #if(val<0) 
    	sub $v0,$0,$v0            #val=-val;}
abs_endif:                # return val;
    	jr $ra                #}



#---------------------------------------------------------------------
#mabs:$v0, i:$s1; cop_x: $f20; cop_y: $s0; result: $f22;
xtoy:                        #float xtoy(float x, int y){
        
    addu $sp,$sp,-20                #prologo
    sw $ra,0($sp)
    sw $s0,4($sp)
    sw $s1,8($sp)
    s.s $f20,12($sp)
    s.s $f22,16($sp)    

    mov.s $f20,$f12                #$f20= cop_x
    move $s0,$a0                #$s0= cop_y
    li $s1,0                    #i=0;
    la $t0,float1                
    l.s $f22,0($t0)                #result=1.0
xtoy_for:
    move $a0,$s0
    jal abs                    #mabs=abs(y)
    bge $s1,$v0,xtoy_endfor            #while(i<mabs){
xtoy_if:
    blez $s0,xtoy_else                #if(y>o)
    mul.s $f22,$f22,$f20            #result*=x;
    j xtoy_endif
xtoy_else:
    div.s $f22,$f22,$f20            #result /= x;
    
xtoy_endif:
    addi $s1,$s1, 1                #i++;
    j xtoy_for                #}
xtoy_endfor:
    mov.s $f0,$f22                #return result
    
    lw $ra,0($sp)                #epilogo
    lw $s0,4($sp)
    lw $s1,8($sp)
    l.s $f20,12($sp)
    l.s $f22,16($sp)
    addu $sp,$sp,20
    jr $ra
    
#------------------------------------------------------------------------------------
    
    #main para teste exercicio 1
    
    .data
x:  .float 2.0

    .text
    .globl main
main:
    addiu $sp,$sp,-4            #int main(void){
    sw $ra, 0 ($sp)
    
    la $t0,x
    l.s $f12,0($t0)
    li $a0,-3
    jal xtoy
    
    mov.s $f12,$f0
    li $v0,2
    syscall
    
    lw $ra,0 ($sp)
    addiu $sp,$sp,4
    li $v0,0
    jr $ra                #}
    