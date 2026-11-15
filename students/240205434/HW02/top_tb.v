`timescale 1ms/1ms

module top_tb;

	reg  [6:0] cnt;
	wire       clk;
	wire       red, green, yellow;

	clk_gen_1s u_clk_gen_1s (.clk(clk));

	always @(posedge clk)
	begin
		if (cnt == 7'd69)
			cnt <= 7'd0;
		else
			cnt <= cnt + 1'b1;
	end

	wire red_en    = (cnt <= 7'd29);
	wire green_en  = (cnt >= 7'd30) && (cnt <= 7'd59);
	wire yellow_en = (cnt >= 7'd60);

	led u_red    (.clk(red_en),          .q(red));
	led u_green  (.clk(green_en),        .q(green));
	led u_yellow (.clk(clk & yellow_en), .q(yellow));

	initial begin
		cnt = 7'd69;
	end

	initial begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0, top_tb);
		#71000 $finish;
	end

endmodule
