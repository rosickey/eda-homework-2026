module cd4017(clk, reset, inhibit, co, q);
	input        clk, reset, inhibit;
	output       co;
	output [7:0] q;
	reg    [3:0] count;

	always @(posedge clk or posedge reset)
	begin
		if (reset)
			count <= 4'd0;
		else if (!inhibit)
		begin
			if (count == 4'd7)
				count <= 4'd0;
			else
				count <= count + 4'd1;
		end
	end

	assign co = (count == 4'd7);
	assign q  = 8'b0000_0001 << count;
endmodule
