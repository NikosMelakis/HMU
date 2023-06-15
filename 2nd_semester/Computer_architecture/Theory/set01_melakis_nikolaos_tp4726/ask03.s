.data
myvar: .word 1, 2, 4, 8, 16, 32
nl: .asciiz "\n"
.text
.globl main
main:
    addi $10,$0,0
    addi $16,$0,0
    addi $4,$0,0
    
    loop:
        lw $10, myvar($16) 

        li $2,1 
        add $4, $4, $10 
        syscall

        addi $16,$16,4 

        # li $2, 4
        # la $4, nl
        # syscall

        beq $4, 63, exit  

    j loop

    exit: