module cd4017(clk,reset,inhibit,carry_out,q);
		input clk,reset,inhibit;//输入
		output carry_out;//进位
		output [9:0] q;//输出
		reg [3:0]count;//计数
		//时序
		always@(posedge clk or posedge reset)
		begin
			if(reset)
				count<=4'b0;
			else if(!inhibit)//使能
			begin
				if(count==9)
					count<=0;
				else
					count<=count+1;
			end	
		end
		//逻辑
		assign q=10'b0000_0000_01<<count;
		assign carry_out=!(count<9);
endmodule