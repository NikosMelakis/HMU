.data
	str_a: .asciiz "Eisigage akeraio thetiko arithmo: "
	str_b: .asciiz "Lathos eisagwgi!"
	str_nl: .asciiz "\n"
.text
.globl main
main:
	addi $2, $0, 4
	la $4, str_a
	syscall
	addi $2, $0, 5
	syscall
	add $15, $2, $0
	addi $14, $0, -1
	blt $15, $0, label1
loop:
	bge $14, $15, telos
	addi $14, $14, 1
	addi $2, $0, 1
	add $4, $0, $14
	syscall
	addi $2, $0, 4
	la $4, str_nl
	syscall
	j loop
label1:
	addi $2, $0, 4
	la $4, str_nl
	syscall
	addi $2, $0, 4
	la $4, str_b
	syscall

telos:
	addi $2, $0, 4
	la $4, str_nl
	syscall
j main