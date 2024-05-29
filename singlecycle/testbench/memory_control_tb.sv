`include "datapath_cache_if.vh"
`include "caches_if.vh"
`include "cache_control_if.vh"
`include "cpu_ram_if.vh"

`timescale 1 ns / 1 ns

module memory_control_tb;
  // clock period
  parameter PERIOD = 20;
  // signals
  logic CLK = 1, nRST;
  logic RAM_CLK = 1;
  // clock
  always #(PERIOD/2) CLK++;
  always #(PERIOD/4) RAM_CLK++;
  // interface
  caches_if cif0 ();
  caches_if cif1 ();
  cache_control_if #(.CPUS(1)) ccif (cif0, cif1);
  cpu_ram_if ramif ();
  datapath_cache_if dpif();
  // test program
  // test PROG (.cif0,.CLK, .nRST);
  
  test PROG (.cif0, .ccif, .ramif, .CLK, .nRST);
  
  // DUT
`ifndef MAPPED
  memory_control MC (ccif);
  ram RAM (RAM_CLK, nRST, ramif);
`else
  memory_ctonrol MC (
    .\ccif.iREN (ccif.iREN),
    .\ccif.dREN (ccif.dREN),
    .\ccif.dWEN (ccif.dWEN),
    .\ccif.dstore (ccif.dstore),
    .\ccif.iaddr (ccif.iaddr),
    .\ccif.daddr (ccif.daddr),
    .\ccif.ramload (ccif.ramload),
    .\ccif.ramstate (ccif.ramstate),
    .\ccif.ccwrite (ccif.ccwrite),
    .\ccif.cctrans (ccif.cctrans),
    .\ccif.iwait (ccif.iwait),
    .\ccif.dwait (ccif.dwait),
    .\ccif.iload (ccif.iload),
    .\ccif.dload (ccif.dload),
    .\ccif.ramstore (ccif.ramstore),
    .\ccif.ramaddr (ccif.ramaddr),
    .\ccif.ramWEN (ccif.ramWEN),
    .\ccif.ramREN (ccif.ramREN),
    .\ccif.ccwait (ccif.ccwait),
    .\ccif.ccinv (ccif.ccinv),
    .\ccif.ccsnoopaddr (ccif.ccsnoopaddr)
  );
  ram RAM (
    .\nRST (nRST),
    .\CLK (RAM_CLK),
    .\ramif.ramaddr (ramif.ramaddr),
    .\ramif.ramstore (ramif.ramstore),
    .\ramif.ramREN (ramif.ramREN),
    .\ramif.ramWEN (ramif.ramWEN),
    .\ramif.ramstate (ramif.ramstate),
    .\ramif.ramload (ramif.ramload)
  );
`endif
  
  task automatic dump_memory();
    string filename = "memcpu.hex";
    int memfd;

    cif0.daddr = 0;
    cif0.dWEN = 0;
    cif0.dREN = 0;

    memfd = $fopen(filename,"w");
    if (memfd)
      $display("Starting memory dump.");
    else
      begin $display("Failed to open %s.",filename); $finish; end

    for (int unsigned i = 0; memfd && i < 16384; i++)
    begin
      int chksum = 0;
      bit [7:0][7:0] values;
      string ihex;

      cif0.daddr = i << 2;
      cif0.dREN = 1;
      repeat (4) @(posedge CLK);
      if (cif0.dload === 0)
        continue;
      values = {8'h04,16'(i),8'h00,cif0.dload};
      foreach (values[j])
        chksum += values[j];
      chksum = 16'h100 - chksum;
      ihex = $sformatf(":04%h00%h%h",16'(i),cif0.dload,8'(chksum));
      $fdisplay(memfd,"%s",ihex.toupper());
    end //for
    if (memfd)
    begin
      cif0.dREN = 0;
      $fdisplay(memfd,":00000001FF");
      $fclose(memfd);
      $display("Finished memory dump.");
    end
  endtask
endmodule

program test(
    caches_if.caches cif0,
    cache_control_if.cc ccif,
    cpu_ram_if.ram ramif,
    input logic CLK,
    output logic nRST
);
  logic [3:0] test_num;
  parameter PERIOD = 20;
  
  // RAM <- Cache Ctr
  assign ramif.ramaddr = ccif.ramaddr;
  assign ramif.ramstore = ccif.ramstore;
  assign ramif.ramREN = ccif.ramREN;
  assign ramif.ramWEN = ccif.ramWEN;
  // RAM -> Cache Ctr
  assign ccif.ramload = ramif.ramload;
  assign ccif.ramstate = ramif.ramstate;

  // Cache Ctr <- Cache
  // assign ccif.iREN = cif0.iREN;
  // assign ccif.dREN = cif0.dREN;
  // assign ccif.dWEN = cif0.dWEN;
  // assign ccif.dstore = cif0.dstore;
  // assign ccif.iaddr = cif0.iaddr;
  // assign ccif.daddr = cif0.daddr;
  // Cache Ctr -> Cache
  // assign cif0.dwait = ccif.dwait;
  // assign cif0.iwait = ccif.iwait;
  // assign cif0.dload = ccif.dload;
  // assign cif0.iload = ccif.iload;

  // Use caches_if (cif0) to drive input stimmulus to memory control module.
  initial begin
    test_num = '0;
    nRST = 0;
    cif0.iREN = '0;
    cif0.dREN = '0;
    cif0.dWEN = '0;
    cif0.dstore = '0;
    cif0.iaddr = '0;
    cif0.daddr = '0;
    @(negedge CLK);
    #(PERIOD)
    test_num += 1; //Write D
    nRST = 1;
    cif0.iREN = '0;
    cif0.dREN = '0;
    cif0.dWEN = 1;
    cif0.dstore = 32'h55555555;
    cif0.iaddr = '0;
    cif0.daddr = 32'h00001000;
    #(PERIOD)
    cif0.iREN = 1; //read I
    cif0.dREN = '0;
    cif0.dWEN = '0;
    #(PERIOD) //read D
    cif0.iREN = '0;
    cif0.dREN = 1;
    cif0.dWEN = '0;
    #(PERIOD)
    cif0.iREN = 1; //read I
    cif0.dREN = '0;
    cif0.dWEN = '0;


    test_num += 1; //Error: Read+Write
    cif0.iREN = 1;
    cif0.dREN = 1;
    cif0.dWEN = 1;
    cif0.dstore = 32'hffffffff;
    cif0.iaddr = 32'd100;
    cif0.daddr = 32'd100;
    // #(PERIOD)
    // cif0.iaddr = 32'd101;
    // cif0.daddr = 32'd101;
    #(PERIOD*3)
    dump_memory();
    $finish;
  end
endprogram
