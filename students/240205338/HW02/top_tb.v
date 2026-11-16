`timescale 1ms/1ms

module top_tb;
	wire clk;
	wire red, yellow, green;
	reg  red_in, yellow_in, green_in;
	reg  [6:0] cnt;

	clk_gen_1s u_clk_gen_1s(.clk(clk));

	led u_led_red   (.clk(red_in),    .out(red));
	led u_led_yellow(.clk(yellow_in), .out(yellow));
	led u_led_green (.clk(green_in),  .out(green));

	always @(negedge clk)
	begin
		if (cnt == 69) cnt <= 0;
		else           cnt <= cnt + 1'b1;
	end

	always @(*)
	begin
		red_in    = 0;
		yellow_in = 0;
		green_in  = 0;
		if (cnt < 30)
			green_in  = 1;
		else if (cnt < 40)
			yellow_in = clk;
		else
			red_in    = 1;
	end

	initial
	begin
		cnt = 0;
		$dumpfile("done");
		$dumpvars();
		#150_000;
		$finish;
	end
endmodule
