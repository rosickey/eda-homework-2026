module clk_gen_1s(clk_1s);
	output clk_1s;
	reg clk_1s;
	initial
	begin
		clk_1s=0;
		forever #0.5 clk_1s=~clk_1s;
	end
	initial
	begin
		#400 $finish();
	end
endmodule