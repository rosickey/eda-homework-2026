module clk_gen(clk);
    output clk;
    reg clk;             // 我加了这一句：把 clk 声明为 reg 类型
    initial
    begin
        clk = 0;         // 改用阻塞赋值 =
        forever #10 clk = ~clk;
    end
endmodule