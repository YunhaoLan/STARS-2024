`include "source/cpu_types_pkg.vh"
`include "source/register_file_if.vh"

module register_file
import cpu_types_pkg::*;
(
    input logic CLK, nRST,
    register_file_if.rf rfif
);

word_t [31:0] regs;
word_t [31:0] nxt_regs;

always_ff @(posedge CLK, negedge nRST ) begin : reg_files
    if (~nRST) begin
        regs <= '0;
    end else begin
        regs <= nxt_regs;
    end
end

always_comb begin : write_reg_file
    nxt_regs = regs;
    if (rfif.WEN && (rfif.wsel != '0)) begin
        nxt_regs[rfif.wsel] = rfif.wdat;
    end
end

// read_reg_file
assign rfif.rdat1 = regs[rfif.rsel1];
assign rfif.rdat2 = regs[rfif.rsel2];

endmodule
