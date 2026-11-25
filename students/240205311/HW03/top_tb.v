module top_tb;
wire clk;
wire carry0,carry1;
wire [7:0] q0,q1;
reg reset,inhibit;

clk_gen u_clk(clk);
CD4017 u_low(clk,reset,inhibit,carry0,q0);
CD4017 u_high(carry0,reset,inhibit,carry1,q1);

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,top_tb);
    reset = 1;
    inhibit = 0;
    #20;
    reset = 0;
    #2000;
    $finish;
end
endmodule