.data
.align 4
matr_C: .space 20
intro: .asciiz "Melakis Nikolaos  TP4726\n\n"
msg1: .asciiz "Give matr_C element: "
msg2: .asciiz "\nThe elements that are smaller than 0 (0<0) are: "
msg3: .asciiz "\nRepeat Process? (1=Yes - 0=No): " 



.text
.globl main
main:
	li $2, 4
	la $4, intro
    syscall
	
	li $16, 4
	li $8, 0
	
LOOP:
L1:
	li $2,4
	la $4,msg1
	syscall
	li $2,5
	syscall

	add $9, $8, $0
	sll $9, $8, 2
	add $11, $2, $0
	sw $11, matr_C ( $9 )
	bgt $11, $0, L2
	addi $20, $20, 1
L2:	
	addi $8, $8, 1
	slt $9, $16, $8
	beq $9, $0, L1
	
	li $2, 4
	la $4, msg2
    syscall
	
	li $2, 1
	move $4, $20
	syscall
	
L3:	
	li $2, 4
	la $4, msg3
    syscall
	li $2, 5      	       
	syscall                        
	move $24, $2  

	
	li $25 , 1
	
	beq $24, $25, LOOP
	beq $24, $0, endloop
	j L3
	
endloop:

	li $2, 10
	
	
	

