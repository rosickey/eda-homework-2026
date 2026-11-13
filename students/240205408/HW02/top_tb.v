`timescale 1s/1ms
module top_tb;
	wire clk_1s, red_out, green_out, yellow_out;
	reg  rst;
	reg  red_sig, green_sig, yellow_sig;
	reg  [6:0] cnt;               

	clk_gen_1s u_clk(clk_1s);
	led u_led_red   (red_sig,    red_out);
	led u_led_yellow(yellow_sig, yellow_out);
	led u_led_green (green_sig,  green_out);

	always @(posedge clk_1s or posedge rst)
		if(rst)               cnt <= 7'd0;
		else if(cnt == 7'd69) cnt <= 7'd0;
		else                  cnt <= cnt + 1'd1;

	always @(*) begin
		red_sig = 1'b0;  green_sig = 1'b0;  yellow_sig = 1'b0;
		if     (cnt < 7'd30) red_sig    = 1'b1;     
		else if(cnt < 7'd40) yellow_sig = clk_1s;  
		else                 green_sig  = 1'b1; 
	end

	initial begin
		$dumpfile("wave.vcd");
		$dumpvars(0, top_tb);
		rst = 1'b1;  #1;  rst = 1'b0;     
		#100;                          
		$finish;
	end
endmodule
