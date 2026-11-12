`timescale 1ms / 1ms
module clk_gen_1s(clk_1s);
	output clk_1s;
	reg clk_1s;
	initial
	begin
		clk_1s<=0;
		forever #500 clk_1s=~clk_1s;
	end
endmodule