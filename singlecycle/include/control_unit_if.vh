`ifndef CONTROL_UNIT_IF_VH
`define CONTROL_UNIT_IF_VH

`include "cpu_types_pkg.vh"


interface control_unit_if;
    import cpu_types_pkg::*;

    logic [3:0] ALUCtr;
    logic RegDest, RegWr, ExtOp, ALUSrc, MemWr, MemtoReg;
    logic J, Beq, Bne, Jr, Jal, ihit, dhit, Halt, Lui;
    word_t Instr;

    modport cu(
        input Instr, ihit, dhit,
        output RegDest, RegWr, ExtOp, ALUSrc, ALUCtr, J, Jr, Jal, Beq, Bne, MemWr, MemtoReg, Halt, Lui
    );

    modport tb(
        output Instr, ihit, dhit,
        input RegDest, RegWr, ExtOp, ALUSrc, ALUCtr, J, Jr, Jal, Beq, Bne, MemWr, MemtoReg, Halt, Lui
    );

endinterface
`endif