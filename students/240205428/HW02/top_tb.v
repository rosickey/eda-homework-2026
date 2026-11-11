module top_tb;

wire clk_1s;
wire yellow_out;  //黄灯接led模块（闪烁）
reg red_out;      //红灯常亮信号
reg green_out;    //绿灯常亮信号

//例化1s时钟
clk_gen_1s u_clk(
    .clk(clk_1s)
);

// 黄灯例化，只用原版led（只有clk、out）
led u_yellow(
    .clk(clk_1s),
    .out(yellow_out)
);

reg [7:0] cnt;

//秒计数器，每1s加1
always @(posedge clk_1s) begin
    cnt <= cnt + 1'b1;
    if(cnt >= 70) cnt <= 0;
end

//时序控制：红30s亮 → 黄灯闪10s → 绿灯30s亮，循环
always @(*) begin
    red_out = 1'b0;
    green_out = 1'b0;
    if(cnt < 30) begin
        red_out = 1'b1;
    end
    else if(cnt >= 40 && cnt <70) begin
        green_out = 1'b1;
    end
    //30~39s：黄灯由led模块自动闪烁，这里不用管
end

//波形导出
initial begin
    cnt = 0;
    $dumpfile("wave.vcd");
    $dumpvars(0,top_tb);
    #100000000000;
    $finish;
end

endmodule
