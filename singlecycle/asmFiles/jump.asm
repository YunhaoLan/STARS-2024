ori $29, $0, 0xfffc

j test

ori $3, $0, 0x3333
addi $29, $29, -4
sw $3, 4($29)
halt

test:
    ori $4, $0, 0x4444
    addi $29, $29, -4
    sw $4, 4($29)
    halt
