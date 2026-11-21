`timescale 1s / 1ms
module top_tb;
wire clk;
reg reset;
wire [9:0] q0;
wire [9:0] q1;
wire carry0;
wire carry0_n;
wire dummy_carry;
assign carry0_n = ~carry0;
clk_gen u_clk(clk);
cd4017 u_unit(clk, reset, 1'b0, carry0, q0);
cd4017 u_tens(carry0_n, reset, 1'b0, dummy_carry, q1);
initial begin
    reset = 1'b1;
    #1 reset = 1'b0;
    $dumpfile("two_digit_cnt.vcd");
    $dumpvars(0, top_tb);
    #2000 $finish;
end
endmodule
