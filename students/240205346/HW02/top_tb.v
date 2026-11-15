`timescale 1ms/1ms
module traffic_led;
wire clk;
wire red_bl,green_bl,yelllow_bl;
reg red,yellow,green;
        clk_gen u_clk(clk);
	led u_red(clk, red_bl);
	led u_green(clk, green_bl);
	led u_yellow(clk, yellow_bl);
localparam EVENT_RED=2'b00, EVENT_GREEN=2'b01, EVENT_YELLOW=2'b10;
reg [1:0] evt= EVENT_RED;
reg [7:0] cnt=8'd0;
always @(posedge clk) begin
    case(evt)
        EVENT_RED: begin
            if(cnt < 8'd29) begin
                cnt <= cnt + 1'd1;
            end else begin
                cnt <= 8'd0;
                evt <= EVENT_GREEN;
            end
        end
        EVENT_GREEN: begin
            if(cnt < 8'd29) begin
                cnt <= cnt + 1'd1;
            end else begin
                cnt <= 8'd0;
                evt <= EVENT_YELLOW;
            end
        end
        EVENT_YELLOW: begin
            if(cnt < 8'd9) begin
                cnt <= cnt + 1'd1;
            end else begin
                cnt <= 8'd0;
                evt <= EVENT_RED;
            end
        end
        default: begin
            evt <= EVENT_RED;
            cnt <= 8'd0;
        end
    endcase
end
always @(*) begin
    case(evt)
        EVENT_RED: begin
            red = 1'b1;
            green = 1'b0;
            yellow = 1'b0;
        end
        EVENT_GREEN: begin
            red = 1'b0;
            green = 1'b1;
            yellow = 1'b0;
        end
        EVENT_YELLOW: begin
            red = 1'b0;
            green = 1'b0;
            yellow = clk;
        end
        default: begin
            red = 1'b1;
            green = 1'b0;
            yellow = 1'b0;
        end
    endcase
end
initial begin
    $dumpfile("wave.vcd");
    $dumpvars();
    #100000 $finish;
end
endmodule