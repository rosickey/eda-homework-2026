module led(clk,l);
	input clk;
	output reg l;
	always@(*)
	begin
		l<=clk;
	end
endmodule