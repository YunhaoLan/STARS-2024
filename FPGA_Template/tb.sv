`timescale 1ms/10ps
module tb;

    logic [20:0] pb; 
    logic [7:0]ss0;
    logic [7:0]ss1;
    logic [7:0]ss2;
    logic [7:0]ss3;
    logic [7:0]ss4;
    logic [7:0]ss5;
    logic [7:0]ss6;
    logic [7:0]ss7;

    parameter PERIOD = 10;
    logic CLK = 0;
    always #(PERIOD/2) CLK++;

    // seven_seg DUT(
    //     .digits(digits), 
    //     .flt_pt(flt_pt),
    //     .ss0(ss0),
    //     .ss1(ss1),
    //     .ss2(ss2),
    //     .ss3(ss3),
    //     .ss4(ss4),
    //     .ss5(ss5),
    //     .ss6(ss6),
    //     .ss7(ss7)
    // );

    top TOP (
        .hz100(CLK), 
        .pb(pb),
        .ss7(ss7), .ss6(ss6), .ss5(ss5), .ss4(ss4), 
        .ss3(ss3), .ss2(ss2), .ss1(ss1), .ss0(ss0));

    test PROG (.CLK, .pb);

endmodule

program test(
input logic CLK,
output logic [20:0] pb
);
logic [3:0] test_num;
parameter PERIOD = 10;

initial begin
    $dumpfile("sim.vcd");
    $dumpvars(0, tb);

    test_num = 0;
    pb='0;
    #(PERIOD)

    test_num += 1;
    pb[19]=1;
    #(PERIOD)

    test_num += 1;
    pb[19] =0;
    pb[18]=1;
    #(PERIOD)

    test_num += 1;
    pb[18]=0;
    #(PERIOD)

    test_num += 1;
    pb[19]=0;
    #(PERIOD)
    #(PERIOD)
    #(PERIOD)

    
    $finish;
end

endprogram