module top_tb;

wire clk;
reg mr;
wire en;
wire q0, q1, q2, q3, q4, q5, q6, q7;
wire led0, led1, led2, led3, led4, led5, led6, led7;

// 实例化时钟模块
clk_gen u_clk_gen (
    .clk(clk)
);

// 实例化1个CD4017
cd4017 u_cd4017 (
    .CLK(clk),
    .EN(en),
    .MR(mr),
    .Q0(q0),
    .Q1(q1),
    .Q2(q2),
    .Q3(q3),
    .Q4(q4),
    .Q5(q5),
    .Q6(q6),
    .Q7(q7)
);

// 实例化8个LED
led u_led0 (.in(q0), .out(led0));
led u_led1 (.in(q1), .out(led1));
led u_led2 (.in(q2), .out(led2));
led u_led3 (.in(q3), .out(led3));
led u_led4 (.in(q4), .out(led4));
led u_led5 (.in(q5), .out(led5));
led u_led6 (.in(q6), .out(led6));
led u_led7 (.in(q7), .out(led7));

// 使能始终有效
assign en = 1'b0;

initial begin
    // 生成波形文件（GTKWave专用）
    $dumpfile("wave.vcd");
    $dumpvars(0, top_tb);
    
    // 上电复位
    mr = 1'b1;
    #20;
    mr = 1'b0;
    
    // 运行20个时钟周期，观察完整流水效果
    #400;
    $stop;
end

endmodule
