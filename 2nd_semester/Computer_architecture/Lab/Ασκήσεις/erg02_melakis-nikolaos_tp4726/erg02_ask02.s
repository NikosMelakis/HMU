.data
.text 
.globl main 
main: 
	addi $16, $0, 20
	addi $17, $0, 10
	beq $16, $17, label1
	sub $18, $17, $16
	j label2
label1:
	sub $18, $16, $17
label2:
	j main 