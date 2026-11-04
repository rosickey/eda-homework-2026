`timescale 1ns / 1ps // 设定时间单位

module top_tb;

    // ==========================================
    // 1. 定义连线 (Wire) 和 寄存器 (Reg)
    // ==========================================
    wire clk;            // 连接 clk_gen 输出的时钟
    
    reg reset;           // 提供给 cd4017 的复位信号 (高电平有效)
    reg inhibit;         // 提供给 cd4017 的抑制信号 (低电平有效，给0就行)
    
    wire [9:0] q;        // cd4017 的 10 位输出 (独热码)
    wire carry_out;      // cd4017 的进位输出 (这次流水灯用不到，但引脚必须连)
    
    wire [7:0] led_out;  // 最终 8 个流水灯的输出信号

    // ==========================================
    // 2. 模块例化 (搭积木)
    // ==========================================

    // 积木1：例化时钟发生器 (注意：它只有一个输出端口 clk)
    clk_gen u_clk_gen (
        .clk(clk)
    );

    // 积木2：例化 CD4017 计数器
    cd4017 u_cd4017 (
        .clk(clk),
        .reset(reset),
        .inhibit(inhibit),
        .carry_out(carry_out),
        .q(q)
    );

    // 积木3：例化 8 个 LED 模块
    // CD4017 每次只有一根线是高电平，我们将 q 的低 8 位 (q[0] 到 q[7]) 分别接到 8 个 LED 上
    led u_led0 ( .clk(q[0]), .out(led_out[0]) );
    led u_led1 ( .clk(q[1]), .out(led_out[1]) );
    led u_led2 ( .clk(q[2]), .out(led_out[2]) );
    led u_led3 ( .clk(q[3]), .out(led_out[3]) );
    led u_led4 ( .clk(q[4]), .out(led_out[4]) );
    led u_led5 ( .clk(q[5]), .out(led_out[5]) );
    led u_led6 ( .clk(q[6]), .out(led_out[6]) );
    led u_led7 ( .clk(q[7]), .out(led_out[7]) );

    // ==========================================
    // 3. 编写激励信号 (让仿真动起来)
    // ==========================================
    initial begin
        // 初始化输入信号
        reset = 1;       // 先给复位信号，让计数器清零
        inhibit = 0;     // 允许计数
        
        // 生成波形文件 (供软件抓取波形图)
        $dumpfile("wave.vcd"); 
        $dumpvars(0, top_tb);

        // 延时一段时间后释放复位
        #50;             
        reset = 0;       

        // 运行足够长的时间，让流水灯跑完几轮
        // CD4017 时钟周期是 20ns，跑一圈 10 次是 200ns
        // 这里延时 1000ns，让它循环跑好几圈，方便你截图
        #1000;           
        
        $display("Simulation finished successfully.");
        $finish;         // 结束仿真
    end

endmodule