.data
	str_a:  .asciiz "a = " 
	str_b:  .asciiz "b = " 
	str_add: .asciiz "a + b = "
	str_sub: .asciiz "a - b = "
	str_mult: .asciiz "a * b = "
	str_nl: .asciiz "\n"
.text
.globl main
main:
	addi    $2, $0, 4  	        
		la      $4, str_a   		         
		syscall    
	addi    $2, $0, 5             
		syscall                 	    
		add     $16, $2, $0
	addi    $2, $0, 4  	       
		la      $4, str_b          
		syscall
	addi    $2, $0, 5             
		syscall                        
		add     $17, $2, $0   
	add $18, $16, $17

	addi    $2, $0, 4       
	la      $4, str_add           
	syscall 

	addi $2, $0, 1	         		
	add $4,$0,$18
	syscall

	addi    $2, $0, 4  	       
	la      $4, str_nl          
	syscall  

	sub $19, $16, $17

	addi    $2, $0, 4  	
	la      $4, str_sub 
	syscall

	addi $2, $0, 1	        		
	add $4,$0,$19
	syscall

	addi    $2, $0, 4  	       
	la      $4, str_nl          
	syscall 
	
	mult $16, $17	
	mflo $20

	addi    $2, $0, 4  	   
	la      $4, str_mult            
	syscall 
  
	addi $2, $0, 1	         
	add $4,$0,$20
	syscall

	addi    $2, $0, 4  	       
	la      $4, str_nl          
	syscall 
           
j main


