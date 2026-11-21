module clk_gen_1s(clk);
	output clk;
	reg clk;
	initial
	begin
		clk=0;
		forever #0.5clk=~clk;
	end
endmodule