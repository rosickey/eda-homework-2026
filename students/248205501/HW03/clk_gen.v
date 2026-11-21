`timescale 1ns/1ns
module clk_gen(clk);
		output reg clk;
		initial
		begin
    		clk <= 0;
    		forever #200 clk = ~clk;
end
endmodule