`timescale 1ns/1ps

module top_tb;
	wire		clk;
	wire		clk_unit;
	wire		clk_tens;
	wire		co_unit;
	wire		co_tens;
	wire [9:0]	q_unit;
	wire [9:0]	q_tens;

	reg		reset;
	reg		inhibit;

	clk_gen u_clk(clk);

	cd4017 u_4017_unit(clk_unit, reset, inhibit, co_unit, q_unit);
	cd4017 u_4017_tens(clk_tens, reset, inhibit, co_tens, q_tens);

	assign clk_unit = clk;
	assign clk_tens = ~co_unit;

	initial
	begin
		$dumpfile("xs.vcd");
		$dumpvars();
		reset   = 1'b1;
		inhibit = 1'b0;
		#15 reset = 1'b0;
		#2020 $finish;
	end
endmodule
