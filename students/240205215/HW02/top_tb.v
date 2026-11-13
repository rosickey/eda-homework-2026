`timescale 1s/1ms

module top_tb;
	wire clk;
	reg [6:0] cnt;
	wire red_sig;
	wire yellow_sig;
	wire green_sig;
	wire led_red;
	wire led_yellow;
	wire led_green;

	clk_gen_1s u_clk_gen_1s(clk);

	led u_led_red(red_sig, led_red);
	led u_led_yellow(yellow_sig, led_yellow);
	led u_led_green(green_sig, led_green);

	initial
	begin
		cnt = 0;
	end

	always @(posedge clk)
	begin
		if (cnt == 69)
			cnt = 0;
		else
			cnt = cnt + 1;
	end

	assign green_sig = (cnt < 30);
	assign yellow_sig = (cnt >= 30 && cnt < 40) ? clk : 1'b0;
	assign red_sig = (cnt >= 40);

	initial
	begin
		#71 $finish;
	end
endmodule
