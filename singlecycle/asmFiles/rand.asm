add $3, $2, $1
and $3, $2, $1
nor $3, $2, $1
or $3, $2, $1
slt $3, $2, $1
sltu $3, $2, $1
sub $3, $2, $1
xor $3, $2, $1
addi $3, $2, 0xaaaa
andi $3, $2, 0xaaaa
lui $3, 0xaaaa
lw $3, 4($2)
sw $3, 4($2)
j test1

test1:
    jal test2
    bne $0, $0, test2
    beq $0, $0, test3

test2:
    jr $31

test3:
    halt
