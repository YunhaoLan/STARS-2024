`include "source/cpu_types_pkg.vh"
`include "source/control_unit_if.vh"
`include "source/pc_if.vh"
`include "source/request_unit_if.vh"
`include "source/datapath_cache_if.vh"
`include "source/alu_if.vh"
`include "source/register_file_if.vh"

module datapath 
import cpu_types_pkg::*;
(
    input logic CLK, nRST,
    datapath_cache_if.dp dpif
);

parameter PC_INIT = 0;
control_unit_if cuif();
pc_if pcif();
request_unit_if ruif();
alu_if aluif();
register_file_if rfif();

control_unit CU (cuif);
pc #(.PC_INIT(PC_INIT)) PC  (CLK, nRST, pcif);
request_unit RU (CLK, nRST, ruif, dpif.halt);
alu ALU (aluif);
register_file RF (CLK, nRST, rfif);

word_t ExtOut;
logic Halt;

always_comb begin : Instruction_Fetch
    cuif.Instr = dpif.imemload;
    cuif.ihit = dpif.ihit;
    cuif.dhit = dpif.dhit;
    pcif.J = cuif.J;
    pcif.Jr = cuif.Jr;
    pcif.Jal = cuif.Jal;
    pcif.Beq = cuif.Beq;
    pcif.Bne = cuif.Bne;
    pcif.ihit = dpif.ihit;
    // pcif.dhit = dpif.dhit;
    pcif.Halt = dpif.halt;
    // pcif.dmemREN = ruif.dmemREN;
    // pcif.dmemWEN = ruif.dmemWEN;
    pcif.portA = rfif.rdat1; // rfif.rdat1 is needed for Jr
//     pcif.ExtOut = ExtOut;
//     pcif.imemload = dpif.imemload;
    pcif.JumpAddr =   dpif.imemload[25:0];
    pcif.BranchAddr = ExtOut;
end

logic nxt_halt, halt;
always_ff @(posedge CLK, negedge nRST ) begin
    if (~nRST) begin
        halt <= 0;
    end else begin
        halt <= nxt_halt;
    end
end
// always_comb begin
//     if (cuif.Halt|dpif.halt) begin
//         nxt_halt = 1'b1;
//     end else begin
//         nxt_halt = 1'b0;
//     end
// end
always_comb begin
    nxt_halt = halt;
    if (cuif.Halt) begin
        nxt_halt = 1'b1;
    end
end
assign dpif.halt = halt;

always_comb begin : Instruction_Decode
    rfif.WEN = cuif.RegWr & (dpif.ihit | dpif.dhit); //Lat = 2
    if (cuif.Jal)begin
        rfif.wsel = 32'd31;
        rfif.rsel1 = '0;
        rfif.rsel2 = '0;
    end else if (cuif.RegDest) begin // R type (including Jr)
        rfif.wsel = dpif.imemload[15:11]; //Rd
        rfif.rsel1 = dpif.imemload[25:21]; //Rs
        rfif.rsel2 = dpif.imemload[20:16]; //Rt
    end else begin // I type
        rfif.wsel = dpif.imemload[20:16]; //Rt
        rfif.rsel1 = dpif.imemload[25:21]; //Rs
        rfif.rsel2 = dpif.imemload[20:16]; //Rt
    end
end


always_comb begin : Execution
    ExtOut = (cuif.ExtOp?{{16{dpif.imemload[15]}}, dpif.imemload[15:0]}: {16'b0, dpif.imemload[15:0]});
    aluif.portA = rfif.rdat1;
    aluif.portB = cuif.ALUSrc ? ExtOut : rfif.rdat2;
    aluif.op = cuif.ALUCtr;

    // if (aluif.zero && cuif.Beq || ~aluif.zero && cuif.Bne) begin
    //     pcif.Equal = 1;sim:/system_tb/DUT/CPU/DP/RF/rfif/WEN

    // end else begin
    //     pcif.Equal = 0;
    // end
    pcif.Equal = aluif.zero;
        
end

always_comb begin : Memory
    ruif.MemtoReg = cuif.MemtoReg;
    ruif.MemWr = cuif.MemWr;
    dpif.dmemREN = ruif.dmemREN;
    dpif.dmemWEN = ruif.dmemWEN;
    dpif.dmemaddr = aluif.out;
    dpif.datomic = 0;
    dpif.imemREN = ruif.imemREN;
    dpif.imemaddr = pcif.PCAddr;
    dpif.dmemstore = rfif.rdat2;
    ruif.ihit = dpif.ihit;
    ruif.dhit = dpif.dhit;
end

always_comb begin : WriteBack
    if (cuif.Lui) begin
        rfif.wdat = {dpif.imemload[15:0], 16'b0};
    end else if (cuif.MemtoReg) begin
        rfif.wdat = dpif.dmemload;
    end else if (cuif.Jal)begin
        rfif.wdat = pcif.PCAddr + 4;
    end else begin
        rfif.wdat = aluif.out;
    end
end
endmodule