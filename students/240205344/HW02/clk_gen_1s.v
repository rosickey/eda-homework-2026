`timescale 1ms/1ms

module clk_gen_1s(clk);
	output clk;
	reg    clk;

	initial
	begin
		clk = 1'b1;                // start high so that the first posedge is 1 s later
		forever #500 clk = ~clk;   // half period = 500 ms, full period = 1 s
	end
endmodule
