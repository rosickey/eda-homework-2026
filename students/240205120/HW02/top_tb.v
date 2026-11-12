`timescale 1s/1ms
module top_tb;
	wire clk;

	wire green, yellow, red;
	wire led_green, led_yellow, led_red;

	reg [6:0] cnt;

	clk_gen_1s u_clk_gen_1s(clk);

	initial
	begin
		cnt = 7'd0;
	end

	always @(negedge clk)
	begin
		if(cnt == 7'd69)
			cnt <= 7'd0;
		else
			cnt <= cnt + 7'd1;
	end

	assign green = (cnt < 7'd30);
	assign yellow = ((cnt >= 7'd30) && (cnt < 7'd40)) ? clk : 1'b0;
	assign red = (cnt >= 7'd40);

	led u_led_green(green, led_green);
	led u_led_yellow(yellow, led_yellow);
	led u_led_red(red, led_red);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars();
		#140 $finish;
	end
endmodule
