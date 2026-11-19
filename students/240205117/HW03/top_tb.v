`timescale 1s/1s

module top_tb;

	wire       clk;
	reg        reset;
	wire [9:0] q_units;
	wire [9:0] q_tens;
	wire       carry_units;
	wire       carry_tens;
	wire       inhibit_tens;

	assign inhibit_tens = ~carry_units;

	clk_gen u_clk_gen(.clk(clk));

	cd4017 u_units(
		.clk(clk),
		.reset(reset),
		.inhibit(1'b0),
		.carry_out(carry_units),
		.q(q_units)
	);

	cd4017 u_tens(
		.clk(clk),
		.reset(reset),
		.inhibit(inhibit_tens),
		.carry_out(carry_tens),
		.q(q_tens)
	);

	initial begin
		$dumpfile("done");
		$dumpvars();
		reset = 1'b1;
		#2.7 reset = 1'b0;
		#50 $finish;
	end

endmodule
