`timescale 1s/100ms

//----------------------------------------------------------------------
// 文件名：clk_gen_1s.v
// 说明  ：由课堂订正的 clk_gen.v 修改而来，端口列表不变，
//         只把输出周期改为 1s（每 0.5s 翻转一次）
//----------------------------------------------------------------------
module clk_gen_1s(clk);
    output clk;
    reg    clk;

    initial begin
        clk = 0;
    end

    always #0.5 clk = ~clk;
endmodule
