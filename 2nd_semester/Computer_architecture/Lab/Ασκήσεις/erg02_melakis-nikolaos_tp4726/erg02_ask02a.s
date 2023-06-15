.data
.text
.globl main
main:
	addi $16, $0, 0
	addi $17, $0, 1
	addi $18, $0, 6
label2: 
	bne $17, $18, label1
j telos
label1:
	add  $16, $16, $17
	addi $17, $17, 1
j label2
telos:
j main
