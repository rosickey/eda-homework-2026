module top_tb;

	wire clk;
	wire clk_tens;
	reg reset;
	wire cout_ones;
	wire cout_tens;
	wire [9:0] q_ones;
	wire [9:0] q_tens;

	clk_gen u_clk_gen(clk);
	cd4017 u_ones(clk,reset,1'b0,cout_ones,q_ones);
	cd4017 u_tens(clk_tens,reset,1'b0,cout_tens,q_tens);

	assign clk_tens=~cout_ones;

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars;
		reset=1;
		#25 reset=0;
		#2075 $finish;
	end
endmodule
