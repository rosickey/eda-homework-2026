`timescale 1s/1ms

module top_tb;
	wire clk;

	reg [6:0] cnt;

	wire green;
	wire yellow;
	wire red;

	wire led_g;
	wire led_r;
	wire led_y;

	assign green  = (cnt <  7'd30);
	assign yellow = (cnt >= 7'd30) && (cnt < 7'd40) && ~clk;
	assign red    = (cnt >= 7'd40);

	clk_gen_1s u_clk(clk);

	led u_led_g(green, led_g);
	led u_led_r(red, led_r);
	led u_led_y(yellow, led_y);

	always@(negedge clk)
	begin
		if(cnt == 7'd69)
			cnt <= 7'd0;
		else
			cnt <= cnt + 1'b1;
	end

	initial
	begin
		cnt = 7'd0;
		#145 $finish;
	end

	initial
	begin
		$dumpfile("wave.vcd");
		$dumpvars(0, top_tb);
	end

	initial
		$monitor("t = %0.1f s , R=%b , Y=%b , G=%b", $realtime, red, yellow, green);
endmodule
