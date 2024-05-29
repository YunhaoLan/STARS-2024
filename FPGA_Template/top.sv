`default_nettype none
// Empty top module
`include "seven_seg.sv"

module top (
  // I/O ports
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
);

  // Your code goes here...
  logic [7:0][3:0] digits;
  logic [7:0] flt_pt;
  type_key TEST (.CLK(hz100), .NRST(~pb[19]), .left_shift(pb[18]), .pb(pb[15:0]), .digits(digits), .flt_pt(flt_pt));
  seven_seg DECODER (.digits(digits), .flt_pt(flt_pt),.ss0(ss0), .ss1(ss1), .ss2(ss2), .ss3(ss3), .ss4(ss4), .ss5(ss5), .ss6(ss6), .ss7(ss7));
  // Add more modules down here...
endmodule

module type_key (
  input logic CLK,
  input logic NRST,
  input logic left_shift,
  input logic [15:0] pb,
  output logic [7:0][3:0] digits,
  output logic [7:0] flt_pt
);
  logic[7:0][3:0] nxt_d;
  logic [2:0] cnt;
  logic [2:0] nxt_cnt;

  always_ff @(posedge CLK, negedge NRST) begin
    if (!NRST) begin
      digits <= '0;
      cnt <= '0;
    end else begin
      digits <= nxt_d;
      cnt <= nxt_cnt;
    end
  end

  always@(posedge left_shift) begin
    nxt_cnt+=1;
  end

  always_comb begin
    flt_pt = 8'b1<<cnt;
    nxt_d = digits;
    case (pb)
      (1<<0): nxt_d[cnt] = 0;
      (1<<1): nxt_d[cnt] = 1;
      (1<<2): nxt_d[cnt] = 2;
      (1<<3): nxt_d[cnt] = 3;
      (1<<4): nxt_d[cnt] = 4;
      (1<<5): nxt_d[cnt] = 5;
      (1<<6): nxt_d[cnt] = 6;
      (1<<7): nxt_d[cnt] = 7;
      (1<<8): nxt_d[cnt] = 8;
      (1<<9): nxt_d[cnt] = 9;
      (1<<10): nxt_d[cnt] = 4'ha;
      (1<<11): nxt_d[cnt] = 4'hb;
      (1<<12): nxt_d[cnt] = 4'hc;
      (1<<13): nxt_d[cnt] = 4'hd;
      (1<<14): nxt_d[cnt] = 4'he;
      (1<<15): nxt_d[cnt] = 4'hf;
      default: nxt_d[cnt] = digits[cnt];
    endcase
  end
endmodule
