`timescale 1ns/1ps
module top_tb;
wire clk;
wire [9:0] q;
wire carry_out;
wire [7:0] led_out;

clk_gen u_clk(.clk(clk));
cd4017 u_cd4017(
    .clk(clk),
    .reset(1'b0),
    .inhibit(1'b0),
    .carry_out(carry_out),
    .q(q)
);

led u0(.sig(q[0]),.light(led_out[0]));
led u1(.sig(q[1]),.light(led_out[1]));
led u2(.sig(q[2]),.light(led_out[2]));
led u3(.sig(q[3]),.light(led_out[3]));
led u4(.sig(q[4]),.light(led_out[4]));
led u5(.sig(q[5]),.light(led_out[5]));
led u6(.sig(q[6]),.light(led_out[6]));
led u7(.sig(q[7]),.light(led_out[7]));

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,top_tb);
    #300 $finish;
end
endmodule
