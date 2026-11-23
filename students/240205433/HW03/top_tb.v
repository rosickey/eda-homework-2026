module top_tb;
	wire clk;
	wire cout_ones, cout_tens;
	wire [9:0] q_ones, q_tens;
	clk_gen clk_gen1(clk);
	cd4017 ones_place(clk, 1'b0, 1'b0, cout_ones, q_ones);
	cd4017 tens_place(cout_ones, 1'b0, 1'b0, cout_tens, q_tens);
	initial
		begin
			$dumpfile("wave");
			$dumpvars(0, top_tb);
			#2100
			$finish;
		end
endmodule
