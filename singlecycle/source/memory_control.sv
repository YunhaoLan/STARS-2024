/*
  Eric Villasenor
  evillase@gmail.com

  this block is the coherence protocol
  and artibtration for ram
*/

// interface include
`include "source/cache_control_if.vh"
`include "source/cpu_ram_if.vh"
// memory types
`include "source/cpu_types_pkg.vh"

module memory_control (
  input logic CLK, nRST,
  cache_control_if.cc ccif
);
  // type import
  import cpu_types_pkg::*;

  // number of cpus for cc
  parameter CPUS = 1;

  always_comb begin : blockName
    // default
    ccif.iload = '0;
    ccif.dload = '0;
    ccif.ramaddr = '0;
    ccif.ramREN = '0;
    ccif.ramstore = '0;
    ccif.ramWEN = '0;
    ccif.iwait = 1;
    ccif.dwait = 1;

    if (ccif.dREN & !ccif.dWEN) begin
      ccif.dload = ccif.ramload;
      ccif.ramaddr = ccif.daddr;
      ccif.ramREN = ccif.dREN;
      ccif.dwait = !(ccif.ramstate == ACCESS); //keep waiting util ACCESS
    end else if (ccif.dWEN & !ccif.dREN) begin
      ccif.ramstore = ccif.dstore;
      ccif.ramaddr = ccif.daddr;
      ccif.ramWEN = 1;
      ccif.dwait = !(ccif.ramstate == ACCESS);
    end else if (ccif.iREN & !(ccif.dWEN | ccif.dREN)) begin //D > I
      ccif.iload = ccif.ramload;
      ccif.ramaddr = ccif.iaddr;
      ccif.ramREN = ccif.iREN;
      ccif.iwait = !(ccif.ramstate == ACCESS);
    end else if (ccif.dWEN & ccif.dREN) begin
      ccif.ramREN = 1;
      ccif.ramWEN = 1;
    end
  end  

endmodule
