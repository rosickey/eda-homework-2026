module clk_gen(clk);
	output  reg clk;
	initial begin
		clk = 0;
		forever #5 clk <= ~clk;
	end
endmodule