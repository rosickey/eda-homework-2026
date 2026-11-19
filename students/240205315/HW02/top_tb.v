module top_tb;
	wire       clk_wire;
	wire       carry_out_wire;
	wire [9:0] q_wire;

	wire led_out_0, led_out_1, led_out_2, led_out_3;
	wire led_out_4, led_out_5, led_out_6, led_out_7;

	reg  reset_reg;

	module top_tb;
wire clk_ls;
wire red, yellow, green;
reg red_in, yellow_in, green_in;
clk_gen_ls u_clk_ls(clk_ls);
led u_red(red_in,red);
led u_yellow(yellow_in,yellow);
led u_green(green_in,green);
reg [6:0] cnt;
reg [1:0] state;
parameter S_RED    = 2'd0;
parameter S_GREEN  = 2'd1;
parameter S_YELLOW = 2'd2;
initial begin
$dumpfile("done");
$dumpvars();
cnt = 7'd0;
state = S_RED;
$monitor("time=%0t, red=%b, yellow=%b, green=%b, state=%0d",$time,red,yellow,green,state);
#800 $finish; 
end
always @(posedge clk_ls) begin
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
            yellow_in = clk_ls;  
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