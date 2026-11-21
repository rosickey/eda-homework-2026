module top_tb;

	wire			clk;
	wire	[1:0]	clk_4017;
	wire	[1:0]	co;
	wire	[9:0]	q_units;
	wire	[9:0]	q_tens;

	reg				reset;
	reg				inhibit;

	clk_gen u_clk(clk);

	cd4017 u_4017_0(clk_4017[0], reset, inhibit, co[0], q_units);
	cd4017 u_4017_1(clk_4017[1], reset, inhibit, co[1], q_tens);

	assign clk_4017[0] = clk;
	assign clk_4017[1] = ~co[0];

	initial
	begin
		$dumpfile("wave.vcd");
		$dumpvars(0, top_tb);
		reset	= 1'b1;
		inhibit	= 1'b0;
		#15 reset = 1'b0;
		#2500 $finish;
	end

endmodule
