module cd4017(clk,carry_out,q);
		input clk;
		output carry_out;
		output [9:0] q;
		reg [3:0] count=0;
		always@(negedge clk)
		begin
			if(count==9)
				count<=0;
			else
				count<=count+1;
		end
		assign carry_out=(count==9);
		assign q=10'b00_0000_0001<<count;
endmodule