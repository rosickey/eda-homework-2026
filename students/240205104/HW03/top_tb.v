`timescale 1ns/1ps
module top_tb;
wire clk;
wire [9:0] q1;
wire [9:0] q2;

clk_gen u_clk(clk);

cd4017 u1(clk, q1);
cd4017 u2(q1[9], q2);

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, top_tb);
    #25000000000;
    $finish;
end
endmodule