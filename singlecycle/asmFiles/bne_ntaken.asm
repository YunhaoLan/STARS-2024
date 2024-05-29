ori $1, $0, 1
ori $2, $0, 1

# ori $29, $0, 0xfffc

# addi $29, $29, -4
bne $1, $2, test
# sw $3, 4($29)
ori $3, $0, 3

halt

test:
    # addi $29, $29, -4
    # sw $3, 4($29)
    ori $4, $0, 4

    halt
