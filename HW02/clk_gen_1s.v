`timescale 1s / 1ns
module clk_gen_1s(clk);
    output reg clk;
    initial begin
        clk = 0;
        forever #0.5 clk = ~clk;
    end
endmodule