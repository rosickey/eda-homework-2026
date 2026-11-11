`timescale 1ns/1ns
module clk_gen_1s(clk);
    		output reg clk;
   		initial begin
        	clk = 0;
        	forever #500 clk = ~clk;
    		end
endmodule