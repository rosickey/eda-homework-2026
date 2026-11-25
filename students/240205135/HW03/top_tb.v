module top_tb;
	wire clk;
	reg reset;
	reg inhibit;
	wire [9:0] q_units;
	wire carry_units;
	wire [9:0] q_tens;
	wire carry_tens;
	wire inhibit_tens;

	assign inhibit_tens = inhibit | ~carry_units;

	clk_gen u_clk_gen (clk);

	cd4017 u_units (clk, reset, inhibit, carry_units, q_units);
	cd4017 u_tens (clk, reset, inhibit_tens, carry_tens, q_tens);

	initial
	begin
		$dumpfile("wave.vcd");
		$dumpvars(0, top_tb);
		reset = 1;
		inhibit = 0;
		#25;
		reset = 0;
		#5000;
		$finish;
	end
endmodule