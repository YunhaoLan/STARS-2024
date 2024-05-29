`include "source/cpu_types_pkg.vh"
`include "source/request_unit_if.vh"

module request_unit 
import cpu_types_pkg::*;
(
    input logic CLK, nRST,
    request_unit_if.ru ruif,
    input logic halt
);

logic dmemREN, nxt_dmemREN, dmemWEN, nxt_dmemWEN;

always_ff @(posedge CLK, negedge nRST ) begin
    if (~nRST) begin
        dmemREN <= 0;
        dmemWEN <= 0;
    end else begin
        dmemREN <= nxt_dmemREN;
        dmemWEN <= nxt_dmemWEN;
    end
end

always_comb begin
    nxt_dmemREN = dmemREN;
    nxt_dmemWEN = dmemWEN;
    ruif.imemREN = 1;//~halt; //always request for instr

    if (ruif.ihit) begin
        nxt_dmemREN = ruif.MemtoReg;
        nxt_dmemWEN = ruif.MemWr;
    end else if (ruif.dhit) begin
        nxt_dmemREN = 0;
        nxt_dmemWEN = 0;
    end
end

assign ruif.dmemREN = dmemREN;
assign ruif.dmemWEN = dmemWEN;
endmodule