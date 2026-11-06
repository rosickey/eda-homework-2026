`timescale 1ns/1ns

//============================================================
// 模块名称：top_tb
// 功能描述：顶层测试平台，流水灯仿真
//           实例化 clk_gen + cd4017 + 8个led
//           实现8个LED依次点亮的流水灯效果
//============================================================
module top_tb;

    //---------- 内部信号线定义 ----------
    wire clk;                  // 时钟信号
    reg  clr;                  // 清零信号（reg因为在initial中赋值）
    reg  en;                   // 使能信号（reg因为在initial中赋值）
    wire [9:0] q;              // cd4017的10位输出

    // 8个LED的输出信号
    wire led0_out;
    wire led1_out;
    wire led2_out;
    wire led3_out;
    wire led4_out;
    wire led5_out;
    wire led6_out;
    wire led7_out;

    //---------- 模块实例化 ----------

    // 1. 时钟生成模块
    clk_gen u_clk(
        .clk(clk)
    );

    // 2. CD4017十进制计数器模块
    cd4017 u_cd4017(
        .clk(clk),
        .en(en),
        .clr(clr),
        .q(q)
    );

    // 3. 八个LED模块实例化
    //    cd4017的q[0]~q[7]分别连接到8个LED的控制端
    led u_led0(
        .ctrl(q[0]),
        .led_out(led0_out)
    );

    led u_led1(
        .ctrl(q[1]),
        .led_out(led1_out)
    );

    led u_led2(
        .ctrl(q[2]),
        .led_out(led2_out)
    );

    led u_led3(
        .ctrl(q[3]),
        .led_out(led3_out)
    );

    led u_led4(
        .ctrl(q[4]),
        .led_out(led4_out)
    );

    led u_led5(
        .ctrl(q[5]),
        .led_out(led5_out)
    );

    led u_led6(
        .ctrl(q[6]),
        .led_out(led6_out)
    );

    led u_led7(
        .ctrl(q[7]),
        .led_out(led7_out)
    );

    //---------- 测试激励 ----------
    initial begin
        // 生成波形文件，用于仿真查看
        $dumpfile("waveform.vcd");
        $dumpvars(0, top_tb);

        // 初始状态：清零有效，使能无效
        clr = 1'b1;
        en  = 1'b0;

        // 等待一段时间后，释放清零，开启使能
        #20  clr = 1'b0;   // 20ns后清零解除
        #10  en  = 1'b1;   // 再过10ns（共30ns）后使能有效，开始计数

        // 仿真运行足够长时间，让流水灯跑几个循环
        #300 $finish();     // 共运行330ns后结束仿真
    end

endmodule
