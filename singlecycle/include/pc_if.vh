`ifndef PC_IF_VH
`define PC_IF_VH

`include "cpu_types_pkg.vh"

interface pc_if;
  import cpu_types_pkg::*;

  logic Jal, Equal, ihit, Halt, Beq, Bne, Jr, J;
  word_t JumpAddr, BranchAddr, PCAddr, portA;


  modport pc (
    input   ihit, Beq, Halt,BranchAddr, portA, JumpAddr, Bne, Jr, J, Jal, Equal,
    output PCAddr
                    
);  

endinterface
`endif