.data
	str_a:	.asciiz "Dwse ton arithmo A: " 
	str_b:	.asciiz "Dwse ton arithmo B: " 
	str_c:	.asciiz "Dwse ton arithmo C: "
	str_end:	.asciiz "To megisto paragomeno apotelesma einai: "
.text
.globl main
main:
	li $2, 4      
	la $4, str_a  		         
	syscall             			
	li $2, 5      	       
	syscall                        
	move $5, $2   
	li $2, 4 	       
	la $4, str_b   		         
	syscall             		
	li $2, 5      	       
	syscall                        
	move $6, $2 
	li $2, 4  	       
	la $4, str_c   		         
	syscall             		
	li $2, 5      	       
	syscall                        
	move $7, $2
jal ypologismos
	li $2, 4
	la $4, str_end
	syscall
	li $2, 1
	move $4, $3
	syscall
	li $2, 10
	syscall
ypologismos:
	bgt $5, $6, L1
	move $15, $6 
	move $18, $5
	j L2
L1: 
	move $15, $5
	move $18, $6
L2:
	bgt $7, $18, L3
	move $16, $18
	move $17, $7
	j telos
L3:
	move $16, $7
	move $17, $18
	j telos
telos:
	mult $15, $16
	mflo $20
	sub $3, $20, $17
	jr $31	