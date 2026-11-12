`timescale 1s/1ms
module top_tb();
wire clk;
wire red_q, green_q, yellow_q;
reg rled, gled, yled;
	clk_gen_1s u_clk_gen_1s(clk);
	led u_red  (rled,   red_q);
	led u_green(gled,   green_q);
	led u_yellow(yled,  yellow_q);
		localparam S_RED    = 2'd0;
		localparam S_GREEN  = 2'd1;
		localparam S_YELLOW = 2'd2;
	reg [1:0] cur_state;
	reg [5:0] cnt;
	initial 
	begin
    		$dumpfile("led3");
    		$dumpvars();
    			cur_state = S_RED;
			cnt = 6'd0;
	end
always @(posedge clk) begin
    case(cur_state)
        S_RED: begin
            if(cnt == 6'd30) begin cnt <= 6'd0; cur_state <= S_GREEN;  end
            else cnt <= cnt + 1'd1;
        end
        S_GREEN: begin
            if(cnt == 6'd30) begin cnt <= 6'd0; cur_state <= S_YELLOW; end
            else cnt <= cnt + 1'd1;
        end
        S_YELLOW: begin
            if(cnt == 6'd10) begin cnt <= 6'd0; cur_state <= S_RED;    end
            else cnt <= cnt + 1'd1;
        end
    endcase
end
always @(*) begin
		rled = 1'b0;
       		gled = 1'b0;
        	yled = 1'b0;
	case(cur_state)
        	S_RED:    rled = 1'b1;
        	S_GREEN:  gled = 1'b1;
        	S_YELLOW: yled = clk;
        endcase
end
	initial
	begin
    		#100;
    		$finish;
end
endmodule