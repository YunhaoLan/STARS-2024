ori $29, $29, 0xfffc
ori $9, $0, 0xfff8
# 8/22/2023

CAL:
    ori $5, $0, 22
    ori $6, $0, 8
    ori $7, $0, 2023

    addi $6, $6, -1
    addi $29, $29, -4
    sw $6, 4($29)
    addi $29, $29, -4
    ori $6, $0, 30
    sw $6, 4($29)
    jal MULT_P
    lw $6, 4($29)
    addi $29, $29, 4
    
    addi $7, $7, -2000
    addi $29, $29, -4
    sw $7, 4($29)
    addi $29, $29, -4
    ori $7, $0, 365
    sw $7, 4($29)
    jal MULT_P
    lw $7, 4($29)
    addi $29, $29, 4
    
    add $5, $5, $6
    add $2, $5, $7
    halt

MULT_P: 
    ori $30, $31, 0
MOVE:
    slt $8, $29, $9
    bne $8, $0, NEXT
    or $31, $0, $30
    jr $31

NEXT:
    jal MULT
    j MOVE

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

