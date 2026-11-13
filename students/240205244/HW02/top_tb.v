`timescale 1s / 1ms
module top_td;
wire clk;
reg green_ctrl, yellow_ctrl, red_ctrl;
wire q_g, q_y, q_r;
clk_gen_1s u_clk(clk);
led u_green(green_ctrl, clk, q_g);
led u_yellow(yellow_ctrl, clk, q_y);
led u_red(red_ctrl, clk, q_r);
reg [7:0] cnt;
always @(posedge clk) begin
    if(cnt == 70) begin
        cnt <= 8'd0;
    end
    else begin
        cnt <= cnt + 8'd1;
    end
end
always @(*) begin
    if(cnt < 30) begin
        green_ctrl = 1'b1;
        yellow_ctrl = 1'b0;
        red_ctrl = 1'b0;
    end
    else if(cnt < 40) begin
        green_ctrl = 1'b0;
        yellow_ctrl = 1'b1;
        red_ctrl = 1'b0;
    end
    else begin
        green_ctrl = 1'b0;
        yellow_ctrl = 1'b0;
        red_ctrl = 1'b1;
    end
end
initial begin
    cnt = 0;
    $dumpfile("traffic.vcd");
    $dumpvars(0, top_td);
    #120 $finish;
end
endmodule