`timescale 1s/1ms

module top_tb;

	parameter	red_time   = 30;
	parameter	green_time = 30;
	parameter	yel_time   = 10;
	localparam	CYCLE      = red_time + green_time + yel_time;

	wire		clk;
	wire [0:2]	out;
	wire [0:2]	led_clk;

	reg [6:0]	cnt;
	reg		red, yellow, green;

	clk_gen_1s u_clk(clk);

	led u_led0(led_clk[0], out[0]);
	led u_led1(led_clk[1], out[1]);
	led u_led2(led_clk[2], out[2]);

	assign led_clk[0] = red;
	assign led_clk[1] = yellow;
	assign led_clk[2] = green;

	always @(posedge clk)
	begin
		if (cnt == CYCLE-1)
			cnt <= 7'd0;
		else
			cnt <= cnt + 1'b1;
	end

	always @(*)
	begin
		red = (cnt < red_time);
		green = (cnt >= red_time) && (cnt < red_time + green_time);
		yellow = (cnt >= red_time + green_time) ? clk : 1'b0;
	end

	initial
	begin
		cnt = 7'd0;

		$dumpfile("xs");
		$dumpvars();

		#(CYCLE*2) $finish;	// 仿真两个完整循环：140s
	end
endmodule
