module cd4017_tb;
reg clk;
reg reset;
reg inhibit;
wire carry_out;
wire [9:0] q;
cd4017 u_cd4017(clk,reset,inhibit,carry_out,q);

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    reset = 1; inhibit = 1;
    #20 reset = 0; inhibit = 0;
    #400 $finish;
end

initial begin
    $dumpfile("cd4017.vcd");
    $dumpvars;
end
endmodule
