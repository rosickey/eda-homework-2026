`timescale 1ns/1ns
module top_tb;

reg system_clock;
reg system_reset;
wire one_second_pulse;

// 三个使能信号
reg red_en;
reg green_en;
reg yellow_en;

// 三个led输出
wire red_led;
wire green_led;
wire yellow_led;

// 实例化1秒时钟模块
clk_gen_1s u_clk_gen(
    .system_clock(system_clock),
    .system_reset(system_reset),
    .one_second_pulse(one_second_pulse)
);

// 实例化3个LED
led u_red(
    .light_enable(red_en),
    .led_out(red_led)
);
led u_green(
    .light_enable(green_en),
    .led_out(green_led)
);
led u_yellow(
    .light_enable(yellow_en),
    .led_out(yellow_led)
);

// 状态定义
localparam S_RED    = 2'd0;  //红灯30s
localparam S_GREEN  = 2'd1;  //绿灯30s
localparam S_YELLOW = 2'd2;  //黄灯闪烁10s

reg [1:0] state;
reg [5:0] cnt;
reg blink;

// 时序逻辑
always @(posedge one_second_pulse or negedge system_reset) begin
    if(!system_reset) begin
        state <= S_RED;
        cnt <= 6'd0;
        blink <= 1'b0;
    end
    else begin
        blink <= ~blink;
        case(state)
            S_RED: begin
                red_en <= 1'b1;
                green_en <= 1'b0;
                yellow_en <= 1'b0;
                if(cnt == 6'd29) begin
                    state <= S_GREEN;
                    cnt <= 6'd0;
                end
                else begin
                    cnt <= cnt + 6'd1;
                end
            end
            S_GREEN: begin
                red_en <= 1'b0;
                green_en <= 1'b1;
                yellow_en <= 1'b0;
                if(cnt == 6'd29) begin
                    state <= S_YELLOW;
                    cnt <= 6'd0;
                end
                else begin
                    cnt <= cnt + 6'd1;
                end
            end
            S_YELLOW: begin
                red_en <= 1'b0;
                green_en <= 1'b0;
                yellow_en <= blink;
                if(cnt == 6'd9) begin
                    state <= S_RED;
                    cnt <= 6'd0;
                end
                else begin
                    cnt <= cnt + 6'd1;
                end
            end
            default: begin
                state <= S_RED;
                cnt <= 6'd0;
            end
        endcase
    end
end

// 产生系统时钟
initial begin
    system_clock = 1'b0;
    forever #10 system_clock = ~system_clock;
end

// 复位
initial begin
    system_reset = 1'b0;
    #20
    system_reset = 1'b1;
end

// 波形dump
initial begin
    $dumpfile("wave.vcd");
    $dumpvars;
    #1200000000;
    $finish;
end

endmodule
