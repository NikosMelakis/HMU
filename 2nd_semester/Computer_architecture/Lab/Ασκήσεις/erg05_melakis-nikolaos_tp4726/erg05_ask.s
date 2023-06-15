.data
	str_numa:	.asciiz "Dwse ton arithmo A: " 
	str_numb:	.asciiz "Dwse to syntelesti B: " 
	str_mes1:	.asciiz "Lathos eisagwgh, prepei B>=0. Xanaprwspathise."
	str_mes2:	.asciiz "Propaidia tou "
	str_mes3:	.asciiz " apo to "
	str_mes4:	.asciiz " ews to "
	str_mes5:	.asciiz " x "
	str_mes6:	.asciiz " = "
	str_nl:	.asciiz "\n" 
.text
.globl main
main: 
		addi $2, $0, 4
		la $4, str_numa
		syscall
		addi $2, $0, 5
		syscall
		add $16, $2, $0
		j label2
label:	
		addi $2, $0, 4
		la $4, str_mes1
		syscall
		addi $2, $0, 4
		la $4, str_nl
		syscall
label2: 
		addi $2, $0, 4
		la $4, str_numb
		syscall
		addi $2, $0, 5
		syscall
		add $17, $2, $0
		blt $17, $0, label
		addi $2, $0, 4
		la $4, str_mes2
		syscall
		addi $2, $0, 1
		add $4, $0, $16
		syscall
		addi $2, $0, 4
		la $4, str_mes3
		syscall
		addi $2, $0, 1
		add $4, $0, $0
		syscall
		addi $2, $0, 4
		la $4, str_mes4
		syscall
		addi $2, $0, 1
		add $4, $0, $17
		syscall
		addi $2, $0, 4
		la $4, str_nl
		syscall
		addi $8, $8, 0
for:	
		mult $8, $16
		mflo $18
		addi $2, $0, 1
		add $4, $0, $8
		syscall
		addi $2, $0, 4
		la $4, str_mes5
		syscall
		addi $2, $0, 1
		add $4, $0, $16
		syscall
		addi $2, $0, 4
		la $4, str_mes6
		syscall
		addi $2, $0, 1
		add $4, $0, $18
		syscall
		addi $2, $0, 4
		la $4, str_nl
		syscall
		addi $8, $8, 1
		ble $8, $17, for
exit_loop:
		addi $2, $0, 4
		la $4, str_nl
		syscall
j main