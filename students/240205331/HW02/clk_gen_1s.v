`timescale 100ms/1ms
module clk_gen_1s(clk);
	output clk;
	reg clk;

	initial
	begin
		clk=0;
		forever #5 clk=~clk;
	end
endmodule
