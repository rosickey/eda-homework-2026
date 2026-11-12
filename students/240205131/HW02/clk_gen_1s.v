`timescale 1s/1ms
module clk_gen_1s(clk);
output clk;
reg clk;
initial
begin
	clk = 1;
	forever #0.5 clk = ~clk;
end
endmodule