module top_tb;
	reg reset;
	wire clk,clk_tens,carry_ones,carry_tens;
	wire [9:0] q_ones,q_tens;

	clk_gen u_clk(clk);
	cd4017 u_ones(clk,reset,1'b0,carry_ones,q_ones);
	cd4017 u_tens(clk_tens,reset,1'b0,carry_tens,q_tens);

	assign clk_tens = ~carry_ones;

	initial
	begin
		$dumpfile("done");
		$dumpvars();
		reset = 1;
		#1 reset = 0;
		#1000 $finish;
	end
endmodule