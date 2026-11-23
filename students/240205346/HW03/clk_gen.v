module clk_gen(clk);
	output clk;
	reg clk;
	initial
	begin
		clk<=0;
		forever #500 clk=~clk;
	end
endmodule