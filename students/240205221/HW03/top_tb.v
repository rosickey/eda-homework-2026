module top_tb;
	wire clk;
	wire clk_tens;
	reg reset;
	reg inhibit;
	wire carry_out_ones;
	wire carry_out_tens;
	wire [9:0] q_ones;
	wire [9:0] q_tens;

	clk_gen u_clk_gen(clk);

	cd4017 u_cd4017_ones(clk, reset, inhibit, carry_out_ones, q_ones);

	assign clk_tens = ~carry_out_ones;

	cd4017 u_cd4017_tens(clk_tens, reset, inhibit, carry_out_tens, q_tens);

	initial begin
		$dumpfile("top_tb.vcd");
		$dumpvars;
		reset = 1'b1;
		inhibit = 1'b0;
		#20 reset = 1'b0;
		#2220 $finish;
	end
endmodule
