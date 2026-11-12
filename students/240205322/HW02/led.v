module led(clk,q);
input clk;
output reg q;
always@(*)
	begin
		if (clk==1)
			q=1;
		else
			q=0;
	end
endmodule