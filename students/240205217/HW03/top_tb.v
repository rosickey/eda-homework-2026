module top_tb;
wire clk;
reg reset;
reg inhibit;
wire carry_out0,carry_out1;
wire [9:0] q0,q1;

clk_gen u_clk_gen(clk);

cd4017 u_low(clk,reset,inhibit,carry_out0,q0);

cd4017 u_high(carry_out0,reset,inhibit,carry_out1,q1);

initial begin
    reset = 1;
    inhibit = 0;
    #20;
    reset = 0;
    #2000 ;
    $finish;
end

initial begin
    $dumpfile("done");
    $dumpvars();
end
endmodule