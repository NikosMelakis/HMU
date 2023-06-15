.data
mystr: .asciiz "mips\n"
msg_1: .asciiz "Memory address is: "
nl: .asciiz "\n"
.text		
.globl main 	 
main:
	li $2, 4       
	la $4, mystr		         
	syscall   
    
    li $15 0
    lw $15 mystr
   
    li $2, 4       
	la $4, msg_1		         
	syscall 

    li $2, 1
    move $4, $15
    syscall

    li $2, 4       
	la $4, nl		         
	syscall  

    li $16, 1
    li $2, 4
    la $4, mystr($16)
    syscall

    li $2, 10
    syscall

    

    



    
