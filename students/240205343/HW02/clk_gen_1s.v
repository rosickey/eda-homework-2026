`timescale 1s/1ms	// 时间单位 1s，精度 1ms
module clk_gen_1s(clk);
	output clk;
	reg clk;
	initial
	begin
		clk=0;//
		forever #0.5 clk=~clk;	// 半周期 500ms，周期 1s
	end
endmodule