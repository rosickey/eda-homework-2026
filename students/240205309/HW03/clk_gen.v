module clk_gen(clk);
	output clk;
	reg clk;
	initial
	begin
		clk=0;
		forever #1 clk=~clk;
	end
	initial
	begin
		#300 $finish();
	end
endmodule