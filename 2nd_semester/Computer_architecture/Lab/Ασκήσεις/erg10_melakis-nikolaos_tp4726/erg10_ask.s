.data
.align 4
Table: .space 24
msg1: .asciiz "Eisigage enan arithmo: "
msg2: .asciiz " "
msg3: .asciiz "\nTo periexomeno tou pinaka einai: "
.text
.globl main
main:

addi $s0,$zero,6
addi $t0,$zero,0
in:
li $v0,4
la $a0,msg1
syscall
li $v0,5
syscall
add $t1,$t0,$zero
sll $t1,$t0,2
add $t3,$v0,$zero
sw $t3,Table ( $t1 )
addi $t0,$t0,1
slt $t1,$s0,$t0
beq $t1,$zero,in

la $a0,Table
addi $a1,$s0,1 

jal buble_sort


li $v0,4
la $a0,msg3
syscall
la $t0,Table

add $t1,$zero,$zero
printtable:
lw $a0,0($t0)
li $v0,1
syscall
li $v0,4
la $a0,msg2
syscall
addi $t0,$t0,4
addi $t1,$t1,1
slt $t2,$s0,$t1
beq $t2,$zero,printtable

li $v0,10
syscall

buble_sort:

add $t0,$zero,$zero 

loop1:
addi $t0,$t0,1 
bgt $t0,$a1,endloop1 

add $t1,$a1,$zero 
loop2:

bge $t0,$t1,loop1 



addi $t1,$t1,-1 

mul $t4,$t1,4 
addi $t3,$t4,-4 
add $t7,$t4,$a0 
add $t8,$t3,$a0 
lw $t5,0($t7)
lw $t6,0($t8)

bgt $t5,$t6,loop2


sw $t5,0($t8)
sw $t6,0($t7)
j loop2

endloop1:
jr $ra