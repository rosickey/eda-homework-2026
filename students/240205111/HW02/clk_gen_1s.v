module clk_gen_ls(clk);
	output clk;
	reg clk;
	initial
	begin
		clk=0;
		forever #0.5clk=~clk;
	end
endmodule