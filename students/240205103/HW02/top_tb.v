`timescale 1s/100ms
module top_tb;
wire clk_1s;
reg red,yellow,green;
reg [5:0] cnt;
reg [1:0] state;

clk_gen_1s u_clk(clk_1s);

initial begin
    cnt = 6'd0;
    state = 2'd0;
end

always @(posedge clk_1s) begin
    case(state)
        2'd0: begin
            if(cnt == 6'd29) begin
                cnt <= 6'd0;
                state <= 2'd1;
            end
            else begin
                cnt <= cnt + 1'd1;
            end
        end
        2'd1: begin
            if(cnt == 6'd9) begin
                cnt <= 6'd0;
                state <= 2'd2;
            end
            else begin
                cnt <= cnt + 1'd1;
            end
        end
        2'd2: begin 
            if(cnt == 6'd29) begin
                cnt <= 6'd0;
                state <= 2'd3;
            end
            else begin
                cnt <= cnt + 1'd1;
            end
        end
        2'd3: begin //黄灯10s
            if(cnt == 6'd9) begin
                cnt <= 6'd0;
                state <= 2'd0;
            end
            else begin
                cnt <= cnt + 1'd1;
            end
        end
        default: begin
            cnt <= 6'd0;
            state <= 2'd0;
        end
    endcase
end

always @(*) begin
    case(state)
        2'd0: begin
            red = 1;
            green = 0;
            yellow = 0;
        end
        2'd1: begin
            red = 0;
            green = 0;
            yellow = clk_1s;
        end
        2'd2: begin
            red = 0;
            green = 1;
            yellow = 0;
        end
        2'd3: begin
            red = 0;
            green = 0;
            yellow = clk_1s;
        end
        default: begin
            red = 1;
            green = 0;
            yellow = 0;
        end
    endcase
end

initial begin
    $dumpfile("wave.vcd");
    $dumpvars;
    #200;
    $finish;
end
endmodule