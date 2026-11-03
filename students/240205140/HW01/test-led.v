`timescale 1ns / 1ps

module test_led;
    wire clk;
    wire [9:0] q;
    wire [7:0] out;
    
    // 【新增】定义一个复位信号，用于初始化
    reg rst;

    clk_gen u_clk_gen(
        .clk(clk)
    );

    cd4017 u_cd4017(
        .clk(clk),
        .reset(rst),     // 【修改】把复位信号接上
        .inhibit(1'b0),  // 允许计数
        .carry_out(),
        .q(q)
    );

    // 8个LED模块例化保持不变
    led u_led0(.clk(q[0]), .out(out[0]));
    led u_led1(.clk(q[1]), .out(out[1]));
    led u_led2(.clk(q[2]), .out(out[2]));
    led u_led3(.clk(q[3]), .out(out[3]));
    led u_led4(.clk(q[4]), .out(out[4]));
    led u_led5(.clk(q[5]), .out(out[5]));
    led u_led6(.clk(q[6]), .out(out[6]));
    led u_led7(.clk(q[7]), .out(out[7]));

    initial begin
        $dumpfile("done.vcd");
        $dumpvars(0, test_led);
        
        // 【新增】上电初始阶段，给复位信号高电平
        rst = 1'b1;
        #50;             // 保持 50ns 的复位时间
        rst = 1'b0;      // 释放复位，让计数器开始工作

        #400 $finish;    // 运行一段时间后结束
    end
endmodule