`timescale 100ms/100ms
module top_tb;
	wire clk;
    	wire red_out, yellow_out, green_out;
    	reg  [7:0] red, yellow, green;      // 各灯时长预置值（BCD码！）
	reg lamp;
	reg [1:0] count;
	reg [7:0] numa;                     // 倒计时（BCD：高4位十位，低4位个位）

	clk_gen_1s u_clk(clk);

	// 三个 led：译码信号穿过 led 到灯上（led 是缓冲器）
	// 注意对应关系：count==1 期间跑的是绿灯时长，count==2 黄灯，count==0 红灯
	led u_red ((count==0),     red_out);      // 红灯
	led u_yel ((count==2)&clk, yellow_out);   // 黄灯闪，周期 1s
	led u_gre ((count==1),     green_out);    // 绿灯

	initial begin
		$dumpfile("o.vcd");
		$dumpvars(0, top_tb);
		green = 8'h30;                  // 30 的 BCD 码
		yellow = 8'h10;                 // 10 的 BCD 码
		red = 8'h30;
		lamp = 1;                       // 开局直接进入倒计时阶段
		count = 2'd1;                   // 1=绿灯时段，numa 预装绿灯时长
		numa = 8'h30;
		#2100 $finish;
	end

	// 每秒：lamp 为 0 时换灯并装倒计时，为 1 时递减倒数
	always @(posedge clk)
	begin
		if (!lamp)
			begin
				lamp <= 1;
				case(count)
					0: begin numa <= green;  count <= 1; end
					1: begin numa <= yellow; count <= 2; end
					2: begin numa <= red;    count <= 0; end
					default: count <= 0;
				endcase
			end
		else
			begin
				if(numa > 1)
					if(numa[3:0] == 0)
						begin
							numa[3:0] <= 4'b1001;
							numa[7:4] <= numa[7:4] - 1;
						end
					else
						numa[3:0] <= numa[3:0] - 1;
				if(numa == 2) lamp <= 0;    // 数到 2 的下一拍切换，配合非阻塞赋值正好 30s/10s
			end
	end
endmodule
