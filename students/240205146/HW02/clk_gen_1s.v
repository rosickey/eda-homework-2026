`timescale 1ms/1ms

module clk_gen_1s(clk);
	output clk;
	reg clk;

	initial
	begin
		clk = 0;
		// 启动时多等待半秒，使第一个上升沿出现在1秒。
		#500;
		forever #500 clk = ~clk;
	end
endmodule
