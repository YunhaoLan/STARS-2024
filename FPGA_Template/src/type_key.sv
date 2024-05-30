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

  always_ff@(posedge left_shift) begin
    if(!NRST) begin
      nxt_cnt<='0;
    end else begin
      nxt_cnt<=nxt_cnt+1;
    end
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