`timescale 1ns / 1ns
module top_tb;
wire clk_1s;
wire red, yellow, green;
reg red_in, yellow_in, green_in;

clk_gen_1s u_clk_1s(clk_1s);

led u_red(red_in,red);
led u_yellow(yellow_in,yellow);
led u_green(green_in,green);

reg [6:0] cnt;
reg [1:0] state;
parameter S_RED    = 2'd0;
parameter S_GREEN  = 2'd1;
parameter S_YELLOW = 2'd2;

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,top_tb);
    cnt = 7'd0;
    state = S_RED;
    $monitor("time=%0t, red=%b, yellow=%b, green=%b, state=%