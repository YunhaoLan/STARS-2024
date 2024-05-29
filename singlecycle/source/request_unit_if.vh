`ifndef REQUEST_UNIT_IF_VH
`define REQUEST_UNIT_IF_VH

`include "cpu_types_pkg.vh"


interface request_unit_if;
    import cpu_types_pkg::*;

    logic MemWr, MemtoReg;
    logic dhit, ihit, dmemREN, dmemWEN, imemREN;

    modport ru(
        input MemtoReg, MemWr, dhit, ihit,
        output dmemREN, dmemWEN, imemREN
    );

    modport tb(
        output MemtoReg, MemWr, dhit, ihit,
        input dmemREN, dmemWEN, imemREN
    );
endinterface
`endif