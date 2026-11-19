`timescale 1s / 100ms

module top_tb;

	wire		clk;
	wire		tens_clk;
	wire		ones_cout;
	wire		tens_cout;
	wire [9:0]	ones_q;
	wire [9:0]	tens_q;

	reg			rst;

	clk_gen u_clk_gen(clk);

	assign tens_clk = ~ones_cout;

	cd4017 u_ones(clk, rst, 1'b0, ones_cout, ones_q);
	cd4017 u_tens(tens_clk, rst, 1'b0, tens_cout, tens_q);

	initial begin
		rst = 1'b1;
		#55 rst = 1'b0;
	end

	initial begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0, top_tb);
	end

	initial begin
		#2100;
		$finish;
	end

endmodule
