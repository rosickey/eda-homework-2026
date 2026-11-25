module top_tb;
	wire       clk_wire;
	wire       carry_units;
	wire       carry_tens;
	wire [9:0] q_units;
	wire [9:0] q_tens;

	wire       clk_tens;

	reg        reset_reg;

	initial
	begin
		reset_reg = 1'b1;
		#25 reset_reg = 1'b0;
	end

	clk_gen u_clk_gen(clk_wire);

	cd4017 u_cd4017_units(clk_wire, reset_reg, 1'b0, carry_units, q_units);
	cd4017 u_cd4017_tens(clk_tens, reset_reg, 1'b0, carry_tens, q_tens);

	assign clk_tens = ~carry_units;

	initial
	begin
		$dumpfile("wave.vcd");
		$dumpvars();
		#2250 $finish;
	end
endmodule
