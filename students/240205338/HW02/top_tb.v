`timescale 1ns/1ps

module top_tb;
	wire clk;
	wire red, yellow, green;

	reg  [6:0] cnt;

	clk_gen_1s u_clk_gen_1s(.clk(clk));

	always @(negedge clk)
	begin
		if (cnt == 69) cnt <= 0;
		else           cnt <= cnt + 1'b1;
	end

	wire red_on    = (cnt < 30);
	wire green_on  = (cnt >= 30) && (cnt < 60);
	wire yellow_on = (cnt >= 60);

	led u_led_red   (.clk(red_on),          .out(red));
	led u_led_yellow(.clk(yellow_on & clk), .out(yellow));
	led u_led_green (.clk(green_on),        .out(green));

	always @(red or yellow or green)
		$display("t = %0d.%0d s : RED = %b  YELLOW = %b  GREEN = %b",
		         $time/1_000_000_000, ($time/100_000_000)%10, red, yellow, green);

	initial
	begin
		cnt = 0;
		$dumpfile("top_tb.vcd");
		$dumpvars(0, top_tb);
		#150_000_000_000;
		$display("---- simulation finished ----");
		$finish;
	end
endmodule
