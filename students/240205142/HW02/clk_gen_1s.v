`timescale 1s / 1ms
module clk_gen_1s(clk);
    output reg clk;
    initial
    begin
        clk = 0;
        forever #0.5 clk = ~clk;    // 0.5s 翻转一次，周期 1s
    end
endmodule
