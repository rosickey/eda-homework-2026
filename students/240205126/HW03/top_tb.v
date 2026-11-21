`timescale 1ns/1ns

module top_tb;
	wire       clk;
	reg        reset;
	wire       tens_clk;
	wire       carry_units;
	wire       carry_tens;
	wire [9:0] q_units;
	wire [9:0] q_tens;

	clk_gen u_clk_gen(clk);
	cd4017 u_units(clk, reset, 1'b0, carry_units, q_units);
	cd4017 u_tens(tens_clk, reset, 1'b0, carry_tens, q_tens);

	assign tens_clk = ~carry_units;

	function [3:0] onehot2dec;
		input [9:0] q;
		integer i;
		begin
			onehot2dec = 4'd0;
			for (i = 0; i < 10; i = i + 1)
				if (q[i] == 1'b1)
					onehot2dec = i;
		end
	endfunction

	wire [3:0] units_dec;
	wire [3:0] tens_dec;

	assign units_dec = onehot2dec(q_units);
	assign tens_dec  = onehot2dec(q_tens);

	initial begin
		$timeformat(-9, 0, " ns", 0);
		$dumpfile("top_tb.vcd");
		$dumpvars(0, top_tb);

		reset = 1'b1;
		repeat (2) @(negedge clk);
		reset = 1'b0;
	end

	initial
		$monitor("time = %0t,  number = %0d%0d", $time, tens_dec, units_dec);

	initial begin
		repeat (110) @(posedge clk);
		#5;
		$display("simulation finished at %0t", $time);
		$finish;
	end
endmodule
