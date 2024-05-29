`include "source/cpu_types_pkg.vh"
`include "source/alu_if.vh"

module alu 
import cpu_types_pkg::*;
(
    alu_if.dut aluif
);

always_comb begin : alu_implementation
    aluif.overflow = '0;
    aluif.out = '0;
    casez (aluif.op)
        ALU_SLL:
            aluif.out = aluif.portB << aluif.portA[4:0];
        ALU_SRL:
            aluif.out = aluif.portB >> aluif.portA[4:0];
        ALU_ADD:
            begin
            aluif.out = aluif.portA + aluif.portB;
            if (aluif.portA[31] && aluif.portB[31] && ~aluif.out[31] || ~aluif.portA[31] && ~aluif.portB[31] && aluif.out[31]) begin
                aluif.overflow = 1'b1;
            end
            end
        ALU_SUB:
            begin
            aluif.out = aluif.portA - aluif.portB;
            if (~aluif.portA[31] && aluif.portB[31] && aluif.out[31] || aluif.portA[31] && ~aluif.portB[31] && ~aluif.out[31]) begin
                aluif.overflow = 1'b1;
            end
            end
        ALU_AND:
            aluif.out = aluif.portA & aluif.portB;
        ALU_OR:
            aluif.out = aluif.portA | aluif.portB;
        ALU_XOR:
            aluif.out = aluif.portA ^ aluif.portB;
        ALU_NOR:
            aluif.out = ~(aluif.portA | aluif.portB);
        ALU_SLT:
            aluif.out = ($signed(aluif.portA) < $signed(aluif.portB));
        ALU_SLTU:
            aluif.out = (aluif.portA < aluif.portB);
    endcase
end

always_comb begin : flag_chk
    aluif.negative = 1'b0;
    aluif.zero = 1'b0;
    if (aluif.out[31] == 1'b1) begin
        aluif.negative = 1'b1;
    end
    if (aluif.out == '0) begin
        aluif.zero = 1'b1;
    end
end
    
endmodule