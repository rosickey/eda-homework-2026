module LED(clk,out);
	input clk;
	output reg out;
	always @(*)
	begin
		out=clk;
	end
endmodule
