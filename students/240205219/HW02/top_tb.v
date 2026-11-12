`timescale 1ms/1ms
module top_tb;
	wire clk_1s;
	wire led_red;
	wire led_yellow;
	wire led_green;
	reg [6:0] time_cnt;
	reg en_red;
	reg en_green;
	reg en_yellow;
	reg vcc_1;
	wire in_red;
	wire in_green;
	wire in_yellow;
	clk_gen_1s u_clk_gen_1s(clk_1s);

	assign in_red    = en_red    ? vcc_1 : 1'b0;
	assign in_green  = en_green  ? vcc_1 : 1'b0;
	assign in_yellow = en_yellow ? clk_1s : 1'b0;

	led u_led_red(in_red, led_red);
	led u_led_green(in_green, led_green);
	led u_led_yellow(in_yellow, led_yellow);

	initial begin
   		 vcc_1 = 1'b1;
	end

	always @(posedge clk_1s) begin
    		if(time_cnt == 7'd69)
       			time_cnt <= 7'd0;
    		else
        			time_cnt <= time_cnt + 1'b1;
		end

	always @(*) begin
    		en_red    = 1'b0;
    		en_green  = 1'b0;
    		en_yellow = 1'b0;
    		if(time_cnt >= 7'd0 && time_cnt < 7'd30) begin
        			en_red = 1'b1;
    		end
    		else if(time_cnt >= 7'd30 && time_cnt < 7'd60) begin
        			en_green = 1'b1;
    		end
    		else if(time_cnt >= 7'd60 && time_cnt < 7'd70) begin
        			en_yellow = 1'b1;
    		end
	end

		initial begin
    		$dumpfile("done");
    		$dumpvars();
    		time_cnt = 7'd0;
    		#100000 $finish();
	end
endmodule