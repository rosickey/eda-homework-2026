module top_tb;
wire clk;
reg reset;
reg inhibit;
wire [9:0] q0;    
wire [9:0] q1;   
wire carry0;    
clk_gen u_clk(clk);
cd4017 u0(clk, reset, inhibit, carry0, q0);
cd4017 u1(carry0, reset, inhibit, , q1);
initial begin
    $dumpfile("wave.vcd");    
    $dumpvars(0, top_tb);
    reset = 1;
    inhibit = 0;
    #15 reset = 0;
    #2000 $finish;
end
endmodule