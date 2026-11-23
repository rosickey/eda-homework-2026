module top_tb;
	wire       clk;
	wire       carry_units;
	wire       carry_tens;
	wire [9:0] q_units;
	wire [9:0] q_tens;

	reg reset;

	initial
	begin
		reset = 1'b1;
		#5 reset = 1'b0;
	end

	clk_gen u_clk_gen (clk);

	cd4017 u_units (clk, reset, 1'b0, carry_units, q_units);

	cd4017 u_tens (~carry_units, reset, 1'b0, carry_tens, q_tens);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars;
		#2010 $finish;
	end
endmodule
