`default_nettype none
`include "source/system_if.vh"

module top 
(
  // I/O ports
  input  logic CLK, nRST, // 12 MHz clock and reset active high
  input  logic [20:0] pb,
  output logic [7:0] left, right,
         ss7, ss6, ss5, ss4, ss3, ss2, ss1, ss0,
  output logic red, green, blue,
  output logic sigout,

  // UART ports
  output logic [7:0] txdata,
  input  logic [7:0] rxdata,
  output logic txclk, rxclk,
  input  logic txready, rxready
);
system_if sif();

system system (CLK, nRST, sif);

sif.tbCTRL = pb[0];
sif.WEN = pb[1];
sif.REN = pb[2];
sif.store = pb[3]; 
sif.addr = pb[4];

ss0 = sif.load;
ss1 = sif.halt;





endmodule
