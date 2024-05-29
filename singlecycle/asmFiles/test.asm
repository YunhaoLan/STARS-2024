ori $2, $0, 0x3
loop:
    addi $2, $2, -1
    # addi $3, $3, 1
    bne $2, $0, loop
    halt
