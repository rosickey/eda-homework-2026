module top_tb;
	wire clk;
	wire cout, tens_cout;
	wire [9:0] q, tens_q;

	clk_gen clk_gen1(clk);
	cd4017 ones_place(clk, 1'b0, 1'b0, cout, q);
	cd4017 tens_place(cout, 1'b0, 1'b0, tens_cout, tens_q);

	initial
	begin
		$dumpfile("done.vcd");
		$dumpvars();
		#30000 $finish;
	end
endmodule