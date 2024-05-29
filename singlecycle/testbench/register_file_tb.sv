/*
  Eric Villasenor
  evillase@gmail.com

  register file test bench
*/

// mapped needs this
`include "register_file_if.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module register_file_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // test vars
  int v1 = 1;
  int v2 = 4721;
  int v3 = 25119;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  register_file_if rfif ();
  // test program
  test PROG (.CLK, .nRST, .rfif);
  // DUT
`ifndef MAPPED
  register_file DUT(CLK, nRST, rfif);
`else
  register_file DUT(
    .\rfif.rdat2 (rfif.rdat2),
    .\rfif.rdat1 (rfif.rdat1),
    .\rfif.wdat (rfif.wdat),
    .\rfif.rsel2 (rfif.rsel2),
    .\rfif.rsel1 (rfif.rsel1),
    .\rfif.wsel (rfif.wsel),
    .\rfif.WEN (rfif.WEN),
    .\nRST (nRST),
    .\CLK (CLK)
  );
`endif

endmodule

    // input   rdat1, rdat2,
    // output  WEN, wsel, rsel1, rsel2, wdat

program test(
  input logic CLK,
  output logic nRST,
  register_file_if.tb rfif
);
logic [2:0] test_num;
parameter PERIOD = 10;
initial begin
  test_num = 0;
  nRST = 0;
  rfif.WEN = '0;
  rfif.wsel = '0;
  rfif.rsel1 = '0;
  rfif.rsel2 = '0;
  rfif.wdat = '0;
  #(PERIOD)
  @(negedge CLK);
  nRST = 1;
  test_num += 1;
  rfif.WEN = 1'b1;
  rfif.wsel = 5'd0;
  rfif.rsel1 = '0;
  rfif.rsel2 = '0;
  rfif.wdat = 32'd5;
  #(PERIOD)
  @(negedge CLK);
  nRST = 1;
  test_num += 1;
  rfif.WEN = 1'b0;
  rfif.wsel = 5'd0;
  rfif.rsel1 = 32'd2;
  rfif.rsel2 = 32'd5;
  rfif.wdat = 32'b0;
  #(PERIOD)
  @(negedge CLK);
  nRST = 1;
  test_num += 1;
  rfif.WEN = 1'b1;
  rfif.wsel = 5'd2;
  rfif.rsel1 = 32'd2;
  rfif.rsel2 = 32'd2;
  rfif.wdat = 32'd10;
  #(PERIOD)
  @(negedge CLK);
  // genvar i;
  // generate
  //   for (i=0; i<31; )
  // endgenerate
  $finish;
end
endprogram
