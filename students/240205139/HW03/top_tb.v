module top_tb;
	wire       clk_wire;
	wire       carry_units;
	wire       carry_tens;
	wire [9:0] q_units;
	wire [9:0] q_tens;

	reg  reset_reg;

	initial
	begin
		reset_reg = 1'b1;
		#5 reset_reg = 1'b0;
	end

	clk_gen u_clk_gen(clk_wire);

	cd4017 u_units(clk_wire, reset_reg, 1'b0, carry_units, q_units);

	cd4017 u_tens(clk_wire, reset_reg, ~carry_units, carry_tens, q_tens);

	initial
	begin
		$dumpfile("wave.vcd");
		$dumpvars();
		#2000 $finish;
	end
endmodule
