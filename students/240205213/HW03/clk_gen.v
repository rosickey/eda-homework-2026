module clk_gen (clk, rst);
    output clk;
    output rst;

    reg clk;
    reg rst;

    // 生成10ns周期方波时钟
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    // 高电平复位，20ns后释放
    initial begin
        rst = 1'b1;
        #20 rst = 1'b0;
    end
endmodule