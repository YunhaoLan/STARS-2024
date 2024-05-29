ori $29, $29, 0xfffc
addi $29, $29, -4
ori $5, $5, 3
ori $6, $6, 2
sw $6, 4($29)
addi $29, $29, -4
sw $5, 4($29)

MULT: 
    lw $2, 4($29)
    addi $29, $29, 4
    lw $3, 4($29)
    addi $29, $29, 4

LOOP:
    add $4, $4, $3
    addi $2, $2, -1
    bne $2, $0, LOOP

    addi $29, $29, -4
    sw $4, 4($29)
halt



