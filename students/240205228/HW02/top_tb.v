`timescale 1s/100ms

// HW02 简易交通灯仿真
// 红、绿灯常亮 30s，黄灯闪亮 10s（闪亮周期 1s）
// 状态顺序：红 -> 绿 -> 黄 -> 红
module top_tb;
	wire clk_1s;
	wire red_out;
	wire green_out;
	wire yellow_out;

	reg red_in;
	reg green_in;
	reg yellow_en;

	wire yellow_in;

	reg [1:0] state;
	reg [4:0] cnt;

	localparam RED    = 2'd0;
	localparam GREEN  = 2'd1;
	localparam YELLOW = 2'd2;

	// 黄灯输入与 1s 时钟相与，实现周期 1s 的闪亮
	assign yellow_in = yellow_en & clk_1s;

	// 实例化 clk_gen_1s 与三个 led
	clk_gen_1s u_clk_gen_1s(clk_1s);
	led u_led_red(red_in, red_out);
	led u_led_green(green_in, green_out);
	led u_led_yellow(yellow_in, yellow_out);

	initial
	begin
		state = RED;
		cnt = 5'd0;
	end

	// 计数控制状态跳转
	always@(posedge clk_1s)
	begin
		case(state)
			RED:
			begin
				if(cnt == 5'd29)
				begin
					state <= GREEN;
					cnt <= 5'd0;
				end
				else
					cnt <= cnt + 5'd1;
			end
			GREEN:
			begin
				if(cnt == 5'd29)
				begin
					state <= YELLOW;
					cnt <= 5'd0;
				end
				else
					cnt <= cnt + 5'd1;
			end
			YELLOW:
			begin
				if(cnt == 5'd9)
				begin
					state <= RED;
					cnt <= 5'd0;
				end
				else
					cnt <= cnt + 5'd1;
			end
			default:
			begin
				state <= RED;
				cnt <= 5'd0;
			end
		endcase
	end

	// 由状态产生各灯输入
	always@(*)
	begin
		red_in = (state == RED);
		green_in = (state == GREEN);
		yellow_en = (state == YELLOW);
	end

	initial
	begin
		$dumpfile("wave.vcd");
		$dumpvars(0, top_tb);
		#75 $finish;
	end
endmodule
