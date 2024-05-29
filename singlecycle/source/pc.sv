`include "source/cpu_types_pkg.vh"
`include "source/pc_if.vh"
  import cpu_types_pkg::*;

module pc  #(parameter PC_INIT)
(
  input logic CLK, nRST,
  pc_if.pc pcif
);

word_t PC;
word_t nxt_PC; 
assign pcif.PCAddr = PC;   

always_ff  @ (posedge CLK, negedge nRST)  begin
  if(!nRST) begin
    PC <= PC_INIT;
  end else if (pcif.ihit & (!pcif.Halt)) begin
    PC <= nxt_PC;
  end

end

always_comb begin

  if(pcif.Beq & pcif.Equal) begin
    nxt_PC = ((pcif.BranchAddr << 2) + PC + 4 );   
  end else if (pcif.Bne & (!pcif.Equal)) begin
    nxt_PC = ((pcif.BranchAddr << 2) + PC + 4 );
  end else if (pcif.Jr) begin
    nxt_PC = pcif.portA; 
  end else if (pcif.J|pcif.Jal) begin
    nxt_PC = PC + 4;
    nxt_PC = {nxt_PC[31:28], pcif.JumpAddr, 2'b0}; 
  end else begin
    nxt_PC  = PC + 4;
  end
end




endmodule