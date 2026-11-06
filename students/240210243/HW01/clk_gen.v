`timescale 1ns/1ns

//============================================================
// 模块名称：clk_gen
// 功能描述：时钟生成模块，产生周期为20ns的方波激励
//           每10ns翻转一次，周期 = 20ns，频率 = 50MHz
//============================================================
module clk_gen(clk);
    output reg clk;       // 时钟输出，reg类型因为在initial块中赋值

    initial begin
        clk = 1'b0;       // 初始时钟为低电平
        forever #10 clk = ~clk;  // 每10ns翻转一次，产生方波
    end

endmodule
