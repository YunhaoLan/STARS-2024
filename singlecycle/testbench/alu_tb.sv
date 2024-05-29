// mapped needs this
`include "register_file_if.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module alu_tb;

  parameter PERIOD = 10;
  logic CLK = 0, nRST;
  always #(PERIOD/2) CLK++;
  // interface
  alu_if aluif ();
  // test program
  test PROG (.aluif, .CLK);
  // DUT
`ifndef MAPPED
  alu DUT(aluif);
`else
  alu DUT(
    .\aluif.portA (aluif.portA),
    .\aluif.portB (aluif.portB),
    .\aluif.op (aluif.op),
    .\aluif.out (aluif.out),
    .\aluif.negative (aluif.negative),
    .\aluif.overflow (aluif.overflow),
    .\aluif.zero (aluif.zero)
  );
`endif
endmodule


program test(
  input CLK,
  alu_if.tb aluif
);
logic [3:0] test_num;
parameter PERIOD = 10;
initial begin
  test_num = 0;
  aluif.op = '0;
  aluif.portA = '0;
  aluif.portB = '0;
  #(PERIOD)
  @(negedge CLK);
  test_num += 1; //case1
  aluif.op = 4'd1;
  aluif.portA = 32'd5;
  aluif.portB = 32'd4;
  #(PERIOD)
  @(negedge CLK);
  test_num += 1; //case2
  aluif.op = 4'd2;
  aluif.portA = 32'h7fffffff;
  aluif.portB = 32'h7fffffff;
  #(PERIOD)
  @(negedge CLK);
  test_num += 1; //case3
  aluif.op = 4'd3;
  aluif.portA = 32'h7fffffff;
  aluif.portB = 32'hffffffff;
  #(PERIOD)
  aluif.portA = 32'h0;
  aluif.portB = 32'h7fffffff;
  #(PERIOD)
  @(negedge CLK);
  test_num += 1; //case4
  aluif.op = 4'd4;
  aluif.portA = 32'h55555555;
  aluif.portB = 32'haaaaaaaa;
  #(PERIOD)
  @(negedge CLK);
  test_num += 1; //case5
  aluif.op = 4'd5;
  aluif.portA = 32'h55555555;
  aluif.portB = 32'haaaaaaaa;
  #(PERIOD)
  @(negedge CLK);
  test_num += 1; //case6
  aluif.op = 4'd6;
  aluif.portA = 32'h55555555;
  aluif.portB = 32'haaaaaaaa;
  #(PERIOD)
  @(negedge CLK);
  test_num += 1; //case7
  aluif.op = 4'd7;
  aluif.portA = 32'h55555555;
  aluif.portB = 32'haaaaaaaa;
  #(PERIOD)
  @(negedge CLK);
  test_num += 1; //case8
  aluif.op = 4'd8;
  aluif.portA = 32'hf5555555;
  aluif.portB = 32'h0aaaaaaa;
  #(PERIOD)
  @(negedge CLK);
  test_num += 1; //case9
  aluif.op = 4'd9;
  aluif.portA = 32'hf5555555;
  aluif.portB = 32'h0aaaaaaa;
  #(PERIOD)
  @(negedge CLK);
  $finish;
end
endprogram
