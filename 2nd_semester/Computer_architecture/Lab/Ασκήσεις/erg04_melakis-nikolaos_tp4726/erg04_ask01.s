.data
	str_a: .asciiz "Please enter integer A:"
	str_b: .asciiz "Please enter integer B:"
	str_c: .asciiz "B is smaller than A"
	str_d: .asciiz "A is smaller than B"
	str_e: .asciiz "A and B are equal"
	str_nl: .asciiz "\n"
.text
.globl main
main:
	addi $2, $0, 4
	la $4, str_a
	syscall

	addi $2, $0, 5
	syscall
	add $16, $2, $0
	
	addi $2, $0,4
	la $4, str_b
	syscall
	
	addi $2, $0, 5
	syscall
	add $17, $2, $0

	bgt $16, $17, label1

	blt $16, $17, label2

	beq $16, $17, label3
label1:
	addi $2, $0, 4
	la $4, str_c
	syscall
	j label4
label2:
	addi $2, $0, 4
	la $4, str_d
	syscall
	j label4
label3:
	addi $2, $0, 4
	la $4, str_e
	syscall
	j label4
	
label4:
	addi $2, $0, 4
	la $4, str_nl
	syscall
j main	
	
	