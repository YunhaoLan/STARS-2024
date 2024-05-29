`include "source/cpu_types_pkg.vh"
`include "source/control_unit_if.vh"

module control_unit 
import cpu_types_pkg::*;
(
    control_unit_if.cu cuif
);

always_comb begin : control_unit
    cuif.RegDest = 0; //RegDest: 0-I, 1-R
    cuif.RegWr = 0;
    cuif.ExtOp = 1;  //ExtOp = 0 -> zero ext; ExtOp = 1 -> sign ext
    cuif.ALUSrc = 0;
    cuif.ALUCtr = '0;
    cuif.J = 0; 
    cuif.Jal = 0;
    cuif.Jr = 0;
    cuif.Halt = 0;
    cuif.Bne = 0;
    cuif.Beq = 0;
    cuif.MemWr = 0;
    cuif.MemtoReg = 0;
    cuif.Lui = 0;
    
    casez (cuif.Instr[31:26])
        RTYPE:begin
            cuif.RegDest = 1;
            cuif.RegWr = 1;
            casez (opcode_t'(cuif.Instr[5:0]))
                SLLV: cuif.ALUCtr = ALU_SLL;
                SRLV: cuif.ALUCtr = ALU_SRL;
                ADD: cuif.ALUCtr = ALU_ADD;
                ADDU: cuif.ALUCtr = ALU_ADD;
                JR: cuif.Jr = 1;
                SUB: cuif.ALUCtr = ALU_SUB;
                SUBU: cuif.ALUCtr = ALU_SUB;
                AND: cuif.ALUCtr = ALU_AND;
                OR: cuif.ALUCtr = ALU_OR;
                XOR: cuif.ALUCtr = ALU_XOR;
                NOR: cuif.ALUCtr = ALU_NOR;
                SLT: cuif.ALUCtr = ALU_SLT;
                SLTU: cuif.ALUCtr = ALU_SLTU;
            endcase
            end
        J:  cuif.J = 1;
        JAL:begin
            cuif.Jal = 1;
            cuif.RegWr = cuif.ihit;
            end
        BEQ:begin
            cuif.Beq = 1;
            cuif.ALUCtr = ALU_SUB;
            end
        BNE:begin
            cuif.Bne = 1;
            cuif.ALUCtr = ALU_SUB;
            end
        ADDI:begin
            cuif.ALUSrc = 1;
            cuif.ALUCtr = ALU_ADD;
            cuif.RegWr = 1;
            end
        ADDIU:begin
            cuif.ALUSrc = 1;
            cuif.ALUCtr = ALU_ADD;
            cuif.RegWr = 1;
            end
        SLTI:begin
            cuif.ALUSrc = 1;
            cuif.ALUCtr = ALU_SLT;
            cuif.RegWr = 1;
            end
        SLTIU:begin
            cuif.ALUSrc = 1;
            cuif.ALUCtr = ALU_SLTU;
            cuif.RegWr = 1;
            end
        ANDI:begin
            cuif.ALUSrc = 1;
            cuif.ALUCtr = ALU_AND;
            cuif.RegWr = 1;
            cuif.ExtOp = 0;
            end
        ORI:begin
            cuif.ALUSrc = 1;
            cuif.ALUCtr = ALU_OR;
            cuif.RegWr = 1;
            cuif.ExtOp = 0;
            end
        XORI:begin
            cuif.ALUSrc = 1;
            cuif.ALUCtr = ALU_XOR;
            cuif.RegWr = 1;
            cuif.ExtOp = 0;
            end
        LUI:begin
            cuif.ALUSrc = 1;
            cuif.RegWr = 1;
            cuif.Lui = 1;
            end
        LW:begin
            cuif.ALUSrc = 1;
            cuif.MemtoReg = 1;
            cuif.RegWr = 1;
            cuif.ALUCtr = ALU_ADD;
            end
        SW:begin
            cuif.ALUSrc = 1;
            cuif.MemWr = 1;
            cuif.ALUCtr = ALU_ADD;
            end
        HALT:begin
            cuif.ExtOp = 0;
            cuif.Halt = 1;
        end

    endcase  
    
end

endmodule