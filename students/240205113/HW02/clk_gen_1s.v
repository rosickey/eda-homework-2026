`timescale 1ns / 1ps

module clk_gen_1s(clk);
    output clk;
    reg clk;
    initial begin
        clk = 0;
        forever #500000000 clk = ~clk; 
    end
endmodule