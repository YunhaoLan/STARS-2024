`include "request_unit_if.vh"

`timescale 1 ns / 1 ns

module request_unit_tb;
    parameter PERIOD = 10;
    logic CLK = 0, nRST;
    always #(PERIOD/2) CLK++;
    request_unit_if ruif ();
    request_unit RU (.CLK, .nRST, .ruif);
    test PROG (.nRST, .ruif);
endmodule

program test(
    output logic nRST,
    request_unit_if.tb ruif
);
    parameter PERIOD = 10;
    initial begin
        nRST = 0;
        ruif.MemtoReg = 0;
        ruif.MemWr = 0;
        ruif.dhit = 0;
        ruif.ihit = 0;
        #(PERIOD)
        nRST = 1;
        ruif.MemtoReg = 0;
        ruif.MemWr = 1;
        ruif.dhit = 1;
        ruif.ihit = 0;
        #(PERIOD)
        ruif.MemtoReg = 1;
        ruif.MemWr = 0;
        ruif.dhit = 1;
        ruif.ihit = 0;
        #(PERIOD)
        ruif.MemtoReg = 0;
        ruif.MemWr = 1;
        ruif.dhit = 0;
        ruif.ihit = 1;
        #(PERIOD)
        ruif.MemtoReg = 1;
        ruif.MemWr = 0;
        ruif.dhit = 0;
        ruif.ihit = 1;
        #(PERIOD)
        $finish;
    end
    

endprogram