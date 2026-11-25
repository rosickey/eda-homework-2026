module top_tb;
    wire clk;
    wire rst;
    wire [9:0] q_unit;
    wire co_unit;
    wire [9:0] q_ten;
    wire co_ten;

    // 实例化时钟激励：端口顺序 clk, rst
    clk_gen u_clk_gen (clk, rst);

    // 个位计数器：端口顺序 CP, EN, MR, Q, CO
    cd4017 u_unit (clk, 1'b0, rst, q_unit, co_unit);

    // 十位计数器：时钟由个位进位驱动
    cd4017 u_ten (co_unit, 1'b0, rst, q_ten, co_ten);

    // 生成 VCD 波形文件
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top_tb);
    end

    // 仿真时长 1000ns，覆盖 00~99 完整计数周期
    initial begin
        #1000 $finish;
    end

endmodule