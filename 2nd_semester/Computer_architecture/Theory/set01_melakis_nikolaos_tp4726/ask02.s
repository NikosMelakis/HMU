.data
myinput: .space 40
str_1: .asciiz "Give an integer: "
msg_1: .asciiz "Programm Interrupted! You entered zero(0)."
msg_2: .asciiz "Programm Completed! You entered 10 integers."
msg_3: .asciiz "\nYour array is: "
msg_4: .asciiz ", "


.text
.globl main
main:
 
    li $20, 1
    li $17, 0
    li $8, 0

    li $25, 0
    li $26, 0
    li $10, 0

loop:
    beq $20, $0, exit1
    bge $17, 10, exit2

    li $2, 4
	la $4, str_1
    syscall

	li $2, 5
	syscall
	move $20, $2

    sw $20, myinput($8)
    addi $8, $8, 4
    addi $17, $17, 1
    
    addi $26, $26, 1
    j loop

exit1:
    li $8, 0
    li $2, 4
	la $4, msg_1
    syscall
    li $2, 4
	la $4, msg_3
    syscall
    j next

exit2:
    li $8, 0
    li $2, 4
	la $4, msg_2
    syscall
    li $2, 4
	la $4, msg_3
    syscall

next:
    lw $10, myinput($8)
    li $2, 1
    move $4, $10
    syscall
    li $2, 4
	la $4, msg_4
    syscall
    addi $8, $8, 4
    addi $25, $25, 1
    bne $25, $26, next
    
    li $2, 10
    syscall