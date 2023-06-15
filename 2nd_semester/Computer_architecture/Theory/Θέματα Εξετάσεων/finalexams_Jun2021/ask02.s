.data
search_string: .asciiz "tp4726"
str_1: .asciiz "Give a num: "
str_2: .asciiz "\\nNum "
str_3: .asciiz " found "
str_4: .asciiz " times in  string "
str_5: .asciiz " could not be found in string " 
size_search_string: .word 21

.text
.globl main
main:
	li $2, 4
	la $4, str_1
    syscall
	li $2, 12
	syscall
	move $9, $2

	la $7, search_string
	lw $8, size_search_string
	li $6, 0
	li $11, 0
	li $13, 0
	
	
loop:
    beq $6, $8, prn_found
    lb $10, search_string($13)
    beq $10, $9, found_a_char
    addi $6, $6, 1
    addi $13, $13, 1
    j loop

found_a_char:
    addi $11, $11, 1
    addi $6, $6, 1
    addi $13, $13, 1
    
    j loop

prn_found:

	beq $11, $0, not_found
	
    la $4, str_2
    li $2, 4
    syscall
	
	li $2, 11
    move $4, $9
    syscall
	
    la $4, str_3
    li $2, 4
    syscall
	
    li $2, 1
	move $4, $11
    syscall
     
	
	la $4, str_4
    li $2, 4
    syscall
	
	la $4, search_string
    li $2, 4
    syscall
	
	j exit

not_found:
	la $4, str_2
    li $2, 4
    syscall
	
    li $2, 11
	move $4, $9
    syscall

	
    la $4, str_5
    li $2, 4
    syscall
	
	la $4, search_string
    li $2, 4
    syscall
	
	
exit:
    li $2, 10
    syscall