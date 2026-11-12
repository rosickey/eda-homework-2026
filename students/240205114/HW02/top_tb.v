`timescale 1s/1ms

module top_tb();

	wire clk_1s;
	wire out_red;
	wire out_yellow;
	wire out_green;

	reg [6:0] cnt;
	reg sig_red;
	reg sig_yellow;
	reg sig_green;

	clk_gen_1s u_clk_gen(clk_1s);

	always @(posedge clk_1s) begin
		if (cnt >= 69)
			cnt <= 7'd0;
		else
			cnt <= cnt + 1'b1;
	end

	always @(*) begin
		sig_red    = 1'b0;
		sig_yellow = 1'b0;
		sig_green  = 1'b0;

		if (cnt < 30)
			sig_green = 1'b1;
		else if (cnt < 40)
			sig_yellow = clk_1s;
		else
			sig_red = 1'b1;
	end

	led led_red    (sig_red,    out_red);
	led led_yellow (sig_yellow, out_yellow);
	led led_green  (sig_green,  out_green);

	initial begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0, top_tb);
		cnt = 7'd0;
		#70;
		$finish;
	end

endmodule
