.data
	matr_A: .space 20
	str_a: .asciiz "Dwse ton 1o arithmo: "
	str_b: .asciiz "Dwse ton 2o arithmo: "
	str_c: .asciiz "Dwse ton 3o arithmo: "
	str_d: .asciiz "Dwse ton 4o arithmo: "
	str_e: .asciiz "Dwse ton 5o arithmo: "
	str_quest: .asciiz "Poio stoixeio theleis na anaktiseis?(1-5): "
	str_answer: .asciiz "To stoixeio einai to: "
	
.text
.globl main
main:

		li $2, 4       
		la $4, str_a  		         
		syscall             		
		
		li $2, 5      	       
		syscall                        
		move $16, $2   
		
		li $2, 4 	       
		la $4, str_b   		         
		syscall             		
		
		li $2, 5      	       
		syscall                        
		move $17, $2 
		
		li $2, 4  	       
		la $4, str_c   		         
		syscall             		
		
		li $2, 5      	       
		syscall                        
		move $18, $2
		
		li $2, 4
		la $4, str_d
		syscall
		
		li $2, 5
		syscall
		move $19, $2
		
		li $2, 4
		la $4, str_e
		syscall
		
		li $2, 5
		syscall
		move $20, $2
		
		li $8, 0
		sw $16, matr_A($8)
		
		li $8, 4
		sw $17, matr_A($8)
		
		li $8, 8
		sw $18, matr_A($8)
		
		li $8, 12
		sw $19, matr_A($8)
		
		li $8, 16
		sw $20, matr_A($8)
		
		li $2, 4
		la $4, str_quest
		syscall
		
		li $2, 5
		syscall
		move $25, $2
		
		li $2, 4
		la $4, str_answer
		syscall
		
		li $9, 1
		li $10, 2
		li $11, 3
		li $12, 4
		li $13, 5
		
		beq $25, $9, L1
		beq $25, $10, L2
		beq $25, $11, L3
		beq $25, $12, L4
		beq $25, $13, L5
		
	L1:
		li $2, 1
		li $8, 0
		lw $14, matr_A($8)
		move $4, $14
		syscall
		j telos
	L2:
		li $2, 1
		li $8, 4
		lw $14, matr_A($8)
		move $4, $14
		syscall
		j telos
	L3:
		li $2, 1
		li $8, 8
		lw $14, matr_A($8)
		move $4, $14
		syscall
		j telos
	L4:
		li $2, 1
		li $8, 12
		lw $14, matr_A($8)
		move $4, $14
		syscall
		j telos
	L5:
		li $2, 1
		li $8, 16
		lw $14, matr_A($8)
		move $4, $14
		syscall
		j telos
		
	telos:		
		li $2, 10
		syscall