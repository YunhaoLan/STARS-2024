ori $29, $29, 0xfffc
ori $5, $0, 2
ori $6, $0, 3
ori $7, $0, 4
addi $29, $29, -4
sw $7, 4($29)
addi $29, $29, -4
sw $6, 4($29)
addi $29, $29, -4
sw $5, 4($29)
ori $9, $0, 0xfff8

MULT_P: 
    slt $8, $29, $9
    bne $8, $0, NEXT
    halt
NEXT:
    jal MULT
    j MULT_P
MULT: 
    lw $2, 4($29)
    addi $29, $29, 4
    lw $3, 4($29)
    addi $29, $29, 4
    ori $4, $0, 0

LOOP:
    add $4, $4, $2
    addi $3, $3, -1
    bne $3, $0, LOOP

    addi $29, $29, -4
    sw $4, 4($29)
    

jr $31

