module led(q,clk);
		input clk;
		output q;
		reg cout;
		always@(posedge clk or negedge clk)	
		cout<=clk;
		assign q=clk;
endmodule