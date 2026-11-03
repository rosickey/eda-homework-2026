`timescale 1ns/1ns
module led(clk,reset,inhibit,led_out);
input clk;
input reset;
input inhibit;
output [7:0] led_out;
wire [9:0] q;
wire carry_out;
cd4017 u_cd4017(
    .clk(clk),
    .reset(reset),
    .inhibit(inhibit),
    .carry_out(carry_out),
    .q(q)
);
assign led_out = q[7:0];
endmodule
