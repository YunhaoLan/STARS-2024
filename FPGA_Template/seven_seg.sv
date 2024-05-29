module seven_seg (
    input logic [7:0][3:0] digits, 
    input logic [7:0] flt_pt,
    output logic [7:0]ss0,
    output logic [7:0]ss1,
    output logic [7:0]ss2,
    output logic [7:0]ss3,
    output logic [7:0]ss4,
    output logic [7:0]ss5,
    output logic [7:0]ss6,
    output logic [7:0]ss7
);
logic [7:0][6:0] seg;
always_comb begin
    integer i;
    for (i = 0; i<8; i++) begin
        case(digits[i])
        0: seg[i] = 7'b0111111;
        1: seg[i] = 7'b0000110;
        2: seg[i] = 7'b1011011;
        3: seg[i] = 7'b1001111;
        4: seg[i] = 7'b1100110;
        5: seg[i] = 7'b1101101;
        6: seg[i] = 7'b1111101;
        7: seg[i] = 7'b0000111;
        8: seg[i] = 7'b1111111;
        9: seg[i] = 7'b1101111;
        4'ha: seg[i] = 7'b1110111;
        4'hb: seg[i] = 7'b1111100;
        4'hc: seg[i] = 7'b0111001;
        4'hd: seg[i] = 7'b1011110;
        4'he: seg[i] = 7'b1111001;
        4'hf: seg[i] = 7'b1110001;
        default: seg[i] = '0;
        endcase 
    end
end

assign ss0 = {flt_pt[0],seg[0]};
assign ss1 = {flt_pt[1],seg[1]};
assign ss2 = {flt_pt[2],seg[2]};
assign ss3 = {flt_pt[3],seg[3]};
assign ss4 = {flt_pt[4],seg[4]};
assign ss5 = {flt_pt[5],seg[5]};
assign ss6 = {flt_pt[6],seg[6]};
assign ss7 = {flt_pt[7],seg[7]};
   
endmodule