.data
array: .space 20
max: .word 4
str_1: .asciiz "Give a number: "
msg_1: .asciiz "\nYou entered: "
msg_2: .asciiz "\nThe greatest number is: "
msg_3: .asciiz ", "


.text
.globl main
main:
 
    
    li $8, 0
    li $10, 0
    li $14, 0
    li $15, 0
    li $16, 0
    li $17, 0
    li $18, 0
    li $20, 0
    li $26, 0

loop:
    bge $17, 5, exitloop

    li $2, 4
	la $4, str_1
    syscall

	li $2, 5
	syscall
	move $20, $2

    sw $20, array($8)
    addi $8, $8, 4
    addi $17, $17, 1
    
    addi $26, $26, 1

    j loop

temp:
    sw $15, max($18)
    move $16, $15
    j next

exitloop:
    li $8, 0
    li $2, 4
	la $4, msg_1
    syscall

print:
    lw $10, array($8)
    li $2, 1
    move $4, $10
    syscall
    move $15, $10
    bgt $15, $16, temp
next:
    li $2, 4
	la $4, msg_3
    syscall
    addi $8, $8, 4
    addi $25, $25, 1
    bne $25, $26, print

    li $2, 4
	la $4, msg_2
    syscall

    li $2, 1
	li $8, 0
	lw $14, max($8)
    move $4, $14
	syscall

    li $2, 10
    syscall

