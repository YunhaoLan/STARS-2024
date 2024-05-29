ori $1, $0, 1
ori $2, $0, 1

beq $1, $2, test
ori $3, $0, 0x3333
halt

test:
    ori $4, $0, 0x4444
    halt
