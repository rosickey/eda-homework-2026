module cd4017(clk,reset,inhibit,co,q);
	input clk,reset,inhibit;
	output co;
	output [7:0] q;
	reg [3:0] cout;
	always@ (posedge clk or posedge reset)
	begin
		if(reset)
			cout<=0;
		else if(!inhibit)
		begin
			if(cout==7)
				cout<=0;
		else
				cout=cout+1;
		end
	end			
	assign co=(cout==7);
	assign q=10'b0000001<<cout;
endmodule