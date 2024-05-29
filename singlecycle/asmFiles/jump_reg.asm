ori $29, $0, 0xffc
ori $4, $0, 0x444
ori $3, $0, 0x333

addi $29, $29, -4
jal func
addi $29, $29, -4
sw $4, 4($29)
halt
func:
    sw $3, 4($29)
    jr $31

