`timescale 1ms/1ms
module clk_gen(clk);
    output reg clk = 1;
    initial
    begin
        forever #500 clk=~clk;
    end
endmodule
