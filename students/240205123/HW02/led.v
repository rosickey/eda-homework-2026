`timescale 1ms / 1ms

module led (
    input  wire clk,    // 输入时钟方波  
    output wire led     // 共阴极LED输出 (1点亮, 0熄灭)
);

    assign led = clk;

endmodule