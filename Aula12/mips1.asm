typedef struct
{
	unsigned int id_number;
	char first_name[18];
	char last_name[15];
	float grade;
} student;
#define MAX_STUDENTS 4
void read_data(student *, int);
student *max(student *, int, float *);
void print_student(student *);
int main(void)
{
	static student st_array[MAX_STUDENTS];
	static float media;
	student *pmax;
	read_data( st_array, MAX_STUDENTS );
	pmax = max( st_array, MAX_STUDENTS, &media );
	print_string("\nMedia: ");
	print_float( media );
	print_student( pmax );
	return 0;
}
max:
	la $t3,max_grade
	l.s $f2,0($t3)
	mtc1 $0,$f4
	cvt.s.w $f4,$f4
	move $t0,$a0
	li $t3,sizest
	mul $t3,$t3,$a1
	addu $t2,$t0,$t3

f_max:
	bge $t0,$t2,end_fmx
	l.s $f6,stgrof($t0)
	add.s $f4,$f4,$f6
	c.le.s $f6,$f2
	bc1t end_if_mx
	mov.s $f2,$f6
	move $t1,$t0
	
end_if_mx:
	addiu $t0,$t0,sizest
	j f_mx

end_fmx:
	mtc1 $a1,$f8
	cvt.s.w $f8,$f8
	div.s $f4,$f4,$f8
	s.s $f4,0($a2)
	move $v0,$t1
	jr $ra

read_data:
	move $t0,$a0
	move $t1,$a1
	li $t2,0
f_rd:	
		
		

main:	addiu $sp,$sp,-4
	sw $ra,0($sp)
	
	la $a0,st_arr
	li $a1,MAX_STUDENTS
	jal read_data
	la $a0,st_arr
	li 
