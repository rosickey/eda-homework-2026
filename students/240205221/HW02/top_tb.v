`timescale 1s/100ms

//----------------------------------------------------------------------
// 文件名：top_tb.v
// 功能  ：HW02 简易交通灯仿真。实例化 1 个 clk_gen_1s 和 3 个 led，
//         绿灯常亮 30s，黄灯闪亮 10s（一次闪亮周期 1s），红灯常亮 30s，
//         70s 为一个循环
//----------------------------------------------------------------------
module top_tb;
    wire clk;

    reg  P_green;
    reg  P_yellow;
    reg  P_red;

    wire Q_green;
    wire Q_yellow;
    wire Q_red;

    clk_gen_1s u_clk_gen_1s(clk);

    led u_led_green (P_green,  Q_green);
    led u_led_yellow(P_yellow, Q_yellow);
    led u_led_red   (P_red,    Q_red);

    // 绿灯：0s 亮，30s 灭，70s 再亮，每次常亮 30s
    initial begin
        P_green = 1'b1;
        forever
        begin
            #30 P_green = 1'b0;
            #40 P_green = 1'b1;
        end
    end

    // 黄灯：30s 起闪亮 10 次（亮 0.5s、灭 0.5s，一次闪亮周期 1s），
    //       再等 60s 到下个周期的 30s 处
    initial begin
        P_yellow = 1'b0;
        #30;
        forever
        begin
            repeat (10)
            begin
                @(posedge clk) P_yellow = 1'b1;
                @(negedge clk) P_yellow = 1'b0;
            end
            #60;
        end
    end

    // 红灯：40s 亮，常亮 30s，70s 灭
    initial begin
        P_red = 1'b0;
        #40 P_red = 1'b1;
        forever
        begin
            #30 P_red = 1'b0;
            #40 P_red = 1'b1;
        end
    end

    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars;
        #72 $finish;
    end
endmodule
