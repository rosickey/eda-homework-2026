module top_tb;
	wire clk;
	wire carry_units, carry_tens;
	wire [9:0] q_units, q_tens;

	reg reset;

	initial
	begin
		reset = 1'b1;
		#40 reset = 1'b0;
	end

	clk_gen u_clk(clk);

	cd4017 u_units(clk, reset, 1'b0, carry_units, q_units);
	cd4017 u_tens(clk, reset, ~carry_units, carry_tens, q_tens);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars();
		#2200 $finish;
	end
endmodule