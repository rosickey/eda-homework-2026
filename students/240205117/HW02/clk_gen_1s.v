`timescale 1s/1s
module clk_gen(clk);
	output clk;
	reg clk;
	initial
	begin
		clk<=0;
		forever #0.5 clk<=~clk;
	end
endmodule