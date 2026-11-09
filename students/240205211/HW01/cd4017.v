module cd4017(clk,reset,inhibit,carry_out,q);
	input clk,reset,inhibit;
	output carry_out;
	output [9:0] q;
	reg [3:0] cout;
	always@(posedge clk or posedge reset)
begin
		if(reset)
				cout<=0;
		else if(!inhibit)
		begin
			if(cout==9)
				cout<=0;
			else
				cout<=cout+1;
		end
end
assign q=10'b0000_0000_01<<cout;            
assign carry_out=!(cout<9);
endmodule