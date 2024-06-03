`default_nettype none
// Empty top module
`include "src/seven_seg.sv"
`include "src/type_key.sv"

module top (
  //I/O ports
  input  logic hz100, reset,
  input  logic [20:0] pb,
  output logic [7:0] left, right,
         ss7, ss6, ss5, ss4, ss3, ss2, ss1, ss0,
  output logic red, green, blue,

  // UART ports
  output logic [7:0] txdata,
  input  logic [7:0] rxdata,
  output logic txclk, rxclk,
  input  logic txready, rxready

  // input  logic hz100,
  // input  logic [20:0] pb,
  // output logic [7:0] ss7, ss6, ss5, ss4, ss3, ss2, ss1, ss0
);

  // Your code goes here...
  logic [7:0][3:0] digits;
  logic [7:0] flt_pt;
  type_key TEST (.CLK(hz100), .NRST(~pb[19]), .left_shift(pb[18]), .right_shift(pb[17]), .pb(pb[15:0]), .digits(digits), .flt_pt(flt_pt));
  seven_seg DECODER (.digits(digits), .flt_pt(flt_pt),.ss0(ss0), .ss1(ss1), .ss2(ss2), .ss3(ss3), .ss4(ss4), .ss5(ss5), .ss6(ss6), .ss7(ss7), .left_right({left, right}), .rgb({red, green, blue}));
  // Add more modules down here...
endmodule
