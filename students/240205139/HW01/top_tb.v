// tb.v  顶层测试文件
module tb;

// 连线定义
wire        clk;
reg         reset;
reg         inhibit;
wire        carry_out;
wire [9:0]  q;

// 8个LED输出
wire L0, L1, L2, L3, L4, L5, L6, L7;

// 例化时钟发生器
clk_gen u_clk_gen(
    .clk(clk)
);

// 例化CD4017
cd4017 u_cd4017(
    .clk(clk),
    .reset(reset),
    .inhibit(inhibit),
    .carry_out(carry_out),
    .q(q)
);

// 例化8个LED模块
LED u_led0 (.clk(q[0]), .L(L0));
LED u_led1 (.clk(q[1]), .L(L1));
LED u_led2 (.clk(q[2]), .L(L2));
LED u_led3 (.clk(q[3]), .L(L3));
LED u_led4 (.clk(q[4]), .L(L4));
LED u_led5 (.clk(q[5]), .L(L5));
LED u_led6 (.clk(q[6]), .L(L6));
LED u_led7 (.clk(q[7]), .L(L7));

// 波形导出
initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb);
end

// 激励信号
initial begin
    reset   = 1'b1;
    inhibit = 1'b1;
    #20;
    reset   = 1'b0;
    inhibit = 1'b0; // 使能计数，开始流水
    
    #400; // 仿真持续时间，足够看几轮流水
    $finish;
end

// 打印监控
initial begin
    $monitor("Time = %0t | clk=%b | q=%10b | L0=%b L1=%b L2=%b L3=%b L4=%b L5=%b L6=%b L7=%b",
              $time, clk, q, L0, L1, L2, L3, L4, L5, L6, L7);
end

endmodule
