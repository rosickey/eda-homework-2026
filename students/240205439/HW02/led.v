`timescale 1ms / 1ms
module led(clk,out);
	input wire clk;
	output reg out;
	always@(*)
	begin
		out=clk;
	end
endmodule

