.data
.text
.globl main
main:

addi $16, $0, 15
addi $16, $16, -8
add  $16, $16, $16
addi $16, $16, -4
j main