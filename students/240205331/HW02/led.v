module led(clk,q);
	input clk;
	output q;
	reg cout;

	always@(posedge clk or negedge clk)
		cout<=clk;

	assign q=cout;
endmodule
