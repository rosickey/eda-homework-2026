module cd4017(clk, reset, inhibit, co, q);

	input			clk, reset, inhibit;
	output			co;
	output	[9:0]	q;

	reg		[3:0]	cout;

	always@(posedge clk or posedge reset)
	begin
		if(reset)
			cout <= 4'd0;
		else if(!inhibit)
		begin
			if(cout == 4'd9)
				cout <= 4'd0;
			else
				cout <= cout + 4'd1;
		end
	end

	assign co = (cout == 4'd9);
	assign q  = 10'b0000001 << cout;

endmodule
