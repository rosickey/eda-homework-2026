module top_tb;

reg clk;
reg rst_n;
wire clk_1s;
wire red_led;
wire green_led;
wire yellow_led;

reg [5:0] time_cnt;
reg [1:0] curr_state;

parameter S_RED    = 2'd0;
parameter S_GREEN  = 2'd1;
parameter S_YELLOW = 2'd2;

// 位置映射：端口顺序严格和模块定义保持一致
clk_gen_1s u_clk_gen_1s (clk, rst_n, clk_1s);
led u_red (clk_1s, rst_n, curr_state == S_RED, 1'b0, red_led);
led u_green (clk_1s, rst_n, curr_state == S_GREEN, 1'b0, green_led);
led u_yellow (clk_1s, rst_n, curr_state == S_YELLOW, 1'b1, yellow_led);

always @(posedge clk_1s or negedge rst_n) begin
    if (!rst_n) begin
        time_cnt <= 6'd0;
        curr_state <= S_RED;
    end
    else begin
        case (curr_state)
            S_RED: begin
                if (time_cnt == 6'd29) begin
                    time_cnt <= 6'd0;
                    curr_state <= S_GREEN;
                end
                else begin
                    time_cnt <= time_cnt + 6'd1;
                end
            end
            S_GREEN: begin
                if (time_cnt == 6'd29) begin
                    time_cnt <= 6'd0;
                    curr_state <= S_YELLOW;
                end
                else begin
                    time_cnt <= time_cnt + 6'd1;
                end
            end
            S_YELLOW: begin
                if (time_cnt == 6'd9) begin
                    time_cnt <= 6'd0;
                    curr_state <= S_RED;
                end
                else begin
                    time_cnt <= time_cnt + 6'd1;
                end
            end
            default: begin
                time_cnt <= 6'd0;
                curr_state <= S_RED;
            end
        endcase
    end
end

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, top_tb);
end

initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

initial begin
    rst_n = 1'b0;
    #10;
    rst_n = 1'b1;
    #20000;
    $finish;
end

endmodule

