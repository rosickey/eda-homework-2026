module led(clk,out);
	input clk;
	output out;
/*
	always@(posedge clk)
	begin
		rout<=clk;
	end
*/
	assign out=clk;
endmodule