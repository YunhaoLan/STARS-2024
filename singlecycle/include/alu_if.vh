`ifndef ALU_IF_VH
`define ALU_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface alu_if;
  // import types
  import cpu_types_pkg::*;

  logic negative, overflow, zero;
  word_t portA, portB, out;
  logic[3:0] op;

  // alu dut
  modport dut (
    input portA, portB, op,
    output out, negative, overflow, zero
  );
  // alu tb
  modport tb (
    output portA, portB, op,
    input out, negative, overflow, zero
  );
endinterface

`endif //ALU_IF_VH