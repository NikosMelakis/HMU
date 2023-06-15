.data
	matr_A: .space 20
	str_a: .asciiz "Dwse ton 1o arithmo: "
	str_b: .asciiz "Dwse ton 2o arithmo: "
	str_c: .asciiz "Dwse ton 3o arithmo: "
	str_d: .asciiz "Dwse ton 4o arithmo: "
	str_e: .asciiz "Dwse ton 5o arithmo: "
	
	NewLine: .asciiz "\n"
	
	
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
			
while:
		blt $8, 0, exit
		lw $14, matr_A($8)
		addi $8, $8, -4
		
		li $2, 1
		move $4, $14
		syscall
		
		li $2, 4
		la $4, NewLine
		syscall
		
		j while
		
exit:
		li $2, 10
		syscall