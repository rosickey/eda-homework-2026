`timescale 1ms/1ms

module top_tb;
	wire clk_wire;

	wire red_wire;
	wire green_wire;
	wire yellow_wire;

	wire out_red;
	wire out_green;
	wire out_yellow;

	reg [6:0] sec;   // 1 s per step, 0 ~ 69

	clk_gen_1s u_clk_gen_1s(clk_wire);

	led u_led_red(red_wire, out_red);
	led u_led_green(green_wire, out_green);
	led u_led_yellow(yellow_wire, out_yellow);

	// red 30 s -> green 30 s -> yellow 10 s, one full cycle = 70 s
	assign red_wire    = (sec < 7'd30);
	assign green_wire  = (sec >= 7'd30) && (sec < 7'd60);
	assign yellow_wire = (sec >= 7'd60) ? clk_wire : 1'b0;   // blink with 1 s period

	always @(posedge clk_wire)
	begin
		if (sec == 7'd69)
			sec <= 7'd0;
		else
			sec <= sec + 7'd1;
	end

	initial
	begin
		sec = 7'd0;

		$dumpfile("wave.vcd");
		$dumpvars(0, top_tb);

		#75000 $finish;
	end
endmodule
