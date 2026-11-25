`timescale 1ms/1ms
module clk_gen_1s(clk);
	output reg clk;
	initial		
	begin
     			clk=0;
			forever #250 clk= ~clk;
	end
endmodule
		