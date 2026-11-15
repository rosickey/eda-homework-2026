`timescale 1ms / 1ms
module top_tb;
wire clk_1s;
wire red, yellow, green;
reg red_in, yellow_in, green_in;

clk_gen_1s u_clk_1s(clk_1s);

led u_red(red_in,red);
led u_yellow(yellow_in,yellow);
led u_green(green_in,green);

reg [6:0] cnt;
reg [1:0] state;
parameter S_RED    = 2'd0;
parameter S_GREEN  = 2'd1;
parameter S_YELLOW = 2'd2;

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,top_tb);
    cnt = 7'd0;
    state = S_RED;
    $monitor("time=%0t, red=%b, yellow=%b, green=%b, state=%0d",$time,red,yellow,green,state);
    #800000 $finish; 
end

always @(posedge clk_1s) begin
    case(state)
        S_RED: begin
            if(cnt == 7'd29) begin   
                cnt <= 7'd0;
                state <= S_GREEN;
            end
            else begin
                cnt <= cnt + 1'b1;
            end
        end
        S_GREEN: begin
            if(cnt == 7'd29) begin   
                cnt <= 7'd0;
                state <= S_YELLOW;
            end
            else begin
                cnt <= cnt + 1'b1;
            end
        end
        S_YELLOW: begin
            if(cnt == 7'd9) begin    
                cnt <= 7'd0;
                state <= S_RED;
            end
            else begin
                cnt <= cnt + 1'b1;
            end
        end
        default: begin
            cnt <= 7'd0;
            state <= S_RED;
        end
    endcase
end

always @(*) begin
    case(state)
        S_RED: begin
            red_in = 1'b1;
            yellow_in = 1'b0;
            green_in = 1'b0;
        end
        S_GREEN: begin
            red_in = 1'b0;
            yellow_in = 1'b0;
            green_in = 1'b1;
        end
        S_YELLOW: begin
            red_in = 1'b0;
            yellow_in = clk_1s;  
            green_in = 1'b0;
        end
        default: begin
            red_in = 1'b0;
            yellow_in = 1'b0;
            green_in = 1'b0;
        end
    endcase
end

endmodule