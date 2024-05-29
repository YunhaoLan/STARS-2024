`include "control_unit_if.vh"
`include "control_unit_if.vh"

`timescale 1 ns / 1 ns

module control_unit_tb;
import cpu_types_pkg::*;
    control_unit_if cuif ();
    control_unit CU (.cuif);
    test PROG (.cuif);
endmodule

program test(
    control_unit_if.tb cuif
);
    parameter PERIOD = 10;
    initial begin
        cuif.Instr = 32'h00411820;
        cuif.ihit = 1;
        cuif.dhit = 1;
        cuif.Instr = 32'h00411824;
        cuif.ihit = 1;
        cuif.dhit = 1;
        #(PERIOD)
        cuif.Instr = 32'h00411827;
        cuif.ihit = 1;
        cuif.dhit = 1;
        #(PERIOD)
        cuif.Instr = 32'h00411825;
        cuif.ihit = 1;
        cuif.dhit = 1;
        #(PERIOD)
        cuif.Instr = 32'h0041182A;
        cuif.ihit = 1;
        cuif.dhit = 1;
        #(PERIOD)
        cuif.Instr = 32'h0041182B;
        cuif.ihit = 1;
        cuif.dhit = 1;
        #(PERIOD)
        cuif.Instr = 32'h00411822;
        cuif.ihit = 1;
        cuif.dhit = 1;
        #(PERIOD)
        cuif.Instr = 32'h00411826;
        cuif.ihit = 1;
        cuif.dhit = 1;
        #(PERIOD)
        cuif.Instr = 32'h2043AAAA;
        cuif.ihit = 1;
        cuif.dhit = 1;
        #(PERIOD)
        cuif.Instr = 32'h3043AAAA;
        cuif.ihit = 1;
        cuif.dhit = 1;
        #(PERIOD)
        cuif.Instr = 32'h3C03AAAA;
        cuif.ihit = 1;
        cuif.dhit = 1;
        #(PERIOD)
        cuif.Instr = 32'h8C430004;
        cuif.ihit = 1;
        cuif.dhit = 1;
        #(PERIOD)
        cuif.Instr = 32'hAC430004;
        cuif.ihit = 1;
        cuif.dhit = 1;
        #(PERIOD)
        cuif.Instr = 32'h0800000E;
        cuif.ihit = 1;
        cuif.dhit = 1;
        #(PERIOD)
        cuif.Instr = 32'h0C000011;
        cuif.ihit = 1;
        cuif.dhit = 1;
        #(PERIOD)
        cuif.Instr = 32'h0800000E;
        cuif.ihit = 1;
        cuif.dhit = 1;
        #(PERIOD)
        cuif.Instr = 32'h03E00008;
        cuif.ihit = 1;
        cuif.dhit = 1;
        #(PERIOD)
        cuif.Instr = 32'h14000001;
        cuif.ihit = 1;
        cuif.dhit = 1;
        #(PERIOD)
        cuif.Instr = 32'h10000001;
        cuif.ihit = 1;
        cuif.dhit = 1;
        #(PERIOD)
        cuif.Instr = 32'hFFFFFFFF;
        cuif.ihit = 1;
        cuif.dhit = 1;
        #(PERIOD)
        $finish;
    end
    

endprogram