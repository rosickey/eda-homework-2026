`timescale 1ns / 1ps

module clk_gen(clk);
    output reg clk;  // 必须声明为 reg 才能在 initial 块中赋值

    initial begin
        clk <= 0;
        forever #10 clk <= ~clk; // 每 10ns 翻转一次，周期 20ns (对应 50MHz)
    end
endmodule