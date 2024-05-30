`timescale 1ms/10ps
module tb_seven_seg;

    logic [7:0][3:0] digits; 
    logic [7:0] flt_pt;
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

    seven_seg TEST (
        .digits(digits), .flt_pt(flt_pt),
        .ss7(ss7), .ss6(ss6), .ss5(ss5), .ss4(ss4), 
        .ss3(ss3), .ss2(ss2), .ss1(ss1), .ss0(ss0));

    test PROG (.CLK, .digits, .flt_pt);

endmodule

program test(
input logic CLK,
output logic [7:0][3:0] digits,
output logic [7:0] flt_pt
);
logic [3:0] test_num;
parameter PERIOD = 10;

initial begin
    $dumpfile("sim.vcd");
    $dumpvars(0, tb_seven_seg);
    flt_pt = '0;
    test_num = 0;
    digits='0;
    #(PERIOD)

    test_num += 1;
    digits[0]=4'hf;
    #(PERIOD)

    test_num += 1;
    digits[1]=4'hf;
    #(PERIOD)


    
    $finish;
end

endprogram