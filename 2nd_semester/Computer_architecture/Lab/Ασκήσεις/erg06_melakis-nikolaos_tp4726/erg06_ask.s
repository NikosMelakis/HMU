.data
	str_a:	.asciiz "Dwse ton arithmo A: " 
	str_b:	.asciiz "Dwse ton arithmo B: " 
	str_c:	.asciiz "Dwse ton arithmo C: "
	str_o:	.asciiz "O " 
	str_min:	.asciiz " einai o mikroteros. " 
	str_max:	.asciiz " einai o megalyteros. " 
	str_notmin:	.asciiz "Den yparxei monadikos mikroteros "
	str_notmax:	.asciiz "Den yparxei monadikos megalyteros "
	str_repeat:	.asciiz "Epanalhpsh diadikasias (1=Nai, 0=Oxi): " 
	str_nl:	.asciiz "\n"

.text
.globl main
main:
	jal input_nums
	
	jal min_num
	
	jal max_num
	
	li $2, 4  	       
	la $4, str_repeat   		         
	syscall 
	
	li $2, 5      	       
	syscall                        
	move $20, $2  
	
	beq $20,$0,stopit
	
	li $8, 1
	
	beq $20,$8,main
	
	stopit:
	li $2,10
	syscall
	
	input_nums:
		
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
		
		jr $31
		
	min_num:
		
		blt $16,$17,label1	
			
			blt $17,$16,label3 
			
				beq $16,$17,label5 
					
					blt $18,$16,label6 
					
					jr $31
					
					label6:
			
						blt $18,$17,label7 

						li $2, 4  	       
						la $4, str_notmin  		         
						syscall 
						
						li $2, 4  	       
						la $4, str_nl          
						syscall  		

						jr $31				
						
					
					label7:
					
						li $2, 4  	       
						la $4, str_o   		         
						syscall 
						
						li $2, 1   		
						move $4, $18
						syscall	

						li $2, 4  	       
						la $4, str_min   		         
						syscall 

						li $2, 4  	       
						la $4, str_nl          
						syscall  
								
						jr $31				
																
				label5:

					li    $2, 4  	       
					la    $4, str_notmin  		         
					syscall 
					
					li    $2, 4  	       
					la    $4, str_nl          
					syscall  
		
					jr $31
		
			label3:
				blt $17,$18,label4 
				
				li $2, 4  	       
				la $4, str_notmin 		         
				syscall 
				
				li $2, 4  	       
				la $4, str_nl          
				syscall  				
				
				jr $31
							
				label4:
				
					li $2, 4  	       
					la $4, str_o   		         
					syscall 
					
					li $2, 1        		
					move $4, $17
					syscall	

					li $2, 4  	       
					la $4, str_min   		         
					syscall 

					li $2, 4  	       
					la $4, str_nl          
					syscall  
										
					jr $31				
		
		label1:
			blt $16,$18,label2 
			
			li $2, 4  	       
			la $4, str_not  		         
			syscall 
			
			li $2, 4  	       
			la $4, str_nl          
			syscall  
			
			jr $31
			
			
		label2:
			li $2, 4  	       
			la $4, str_o   		         
			syscall 
			
			li $2, 1        		
			move $4, $16
			syscall	

			li $2, 4  	       
			la $4, str_min   		         
			syscall 	

			li $2, 4  	       
			la  $4, str_nl          
			syscall  
					
			
			jr $31
		
	max_num:

		bgt $16,$17,label8	
			
			bgt $17,$16,label10 
			
				bgt $18,$16,label13 
					
					jr $31
					
					label13:
			
						bgt $18,$17,label14

						li $2, 4  	       
						la $4, str_notmax  		         
						syscall 
						
						li $2, 4  	       
						la $4, str_nl          
						syscall  
							
						jr $31
						
						
					label14:
					
						li $2, 4  	       
						la $4, str_o   		         
						syscall 
						
						li $2, 1        		
						move $4, $18
						syscall	

						li $2, 4  	       
						la $4, str_max   		         
						syscall 			
						
						li $2, 4  	       
						la $4, str_nl          
						syscall  
								
						jr $31				
				

			label10:
				bgt $17,$18,label11
				
					beq $17,$18,label12
				
						li  $2, 4  	       
						la  $4, str_o   		         
						syscall 
						
						li $2, 1        		
						move $4, $18
						syscall	

						li $2, 4  	       
						la $4, str_max   		         
						syscall 				
				
						li $2, 4  	       
						la $4, str_nl          
						syscall  
						
						jr $31
						
				label12:

					li $2, 4  	       
					la $4, str_notmax  		         
					syscall 
					
					li $2, 4  	       
					la $4, str_nl          
					syscall  
							
					jr $31
									
				label11:
				
					li $2, 4  	       
					la $4, str_o   		         
					syscall 
					
					li $2, 1        		
					move $4, $17
					syscall	

					li $2, 4  	       
					la $4, str_max   		         
					syscall 

					li $2, 4  	       
					la $4, str_nl          
					syscall  
							
					
					jr $31				
				
				
		
		label8:
			bgt $16,$18,label9 
			
			li $2, 4  	       
			la $4, str_notmax  		         
			syscall 
			
			li $2, 4  	       
			la $4, str_nl          
			syscall  	
			
			jr $31
			
			
		label9:
			li $2, 4  	       
			la $4, str_o   		         
			syscall 
			
			li $2, 1        		
			move $4, $16
			syscall	

			li $2, 4  	       
			la $4, str_max  		         
			syscall 			
			
			li $2, 4  	       
			la $4, str_nl          
			syscall  
					
			jr $31
				
		
		
		
	j main 
	