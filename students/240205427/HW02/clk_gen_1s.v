`timescale 1s/1ms
module clk_gen_1s(clk);
    output reg clk;

    initial begin
        clk = 1'b1;
        forever #0.5 clk = ~clk; 
    end
endmodule