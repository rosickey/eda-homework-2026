`timescale 1ms/1ms
module clk_gen_1s(clk);
    output reg clk = 0;
    initial
    begin
        forever #500 clk=~clk;
    end
endmodule