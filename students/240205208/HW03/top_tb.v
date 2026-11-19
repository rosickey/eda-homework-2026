`timescale 1ns/1ns
module top_tb;
wire clk;
reg reset;
reg inhibit;
wire [9:0] q_low;    
wire [9:0] q_high;  
wire carry_low;

clk_gen u_clk(
    .clk(clk)
);

cd4017 u_low(
    .clk(clk),
    .reset(reset),
    .inhibit(inhibit),
    .carry_out(carry_low),
    .q(q_low)
);

cd4017 u_high(
    .clk(~carry_low),
    .reset(reset),
    .inhibit(inhibit),
    .carry_out(),
    .q(q_high)
);

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,top_tb);
    reset = 1'b1;
    inhibit = 1'b0;
    #20;
    reset = 1'b0;
    #4000;
    $finish;
end
endmodule
