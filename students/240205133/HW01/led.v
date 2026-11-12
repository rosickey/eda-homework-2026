//共阴极LED模块,并且测试
module led(clk,out);
	input clk;
	output reg out;
	always@(clk)
	begin
		 out<=clk;
	end
endmodule
//


