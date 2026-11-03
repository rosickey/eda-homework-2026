`timescale 1ns / 1ps

module led(clk, out);
    input  clk;
    output out;

    assign out = clk;  // 将输入的信号直接赋值给输出
endmodule