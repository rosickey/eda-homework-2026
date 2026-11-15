module led(clk_1s,blink,out);
	input clk_1s,blink;
	output out;
	wire out;
	assign out=blink?clk_1s:1'b1;
endmodule