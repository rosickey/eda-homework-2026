`timescale 1s/100ms

module top_tb;
	wire clk_1s;

	wire led_red;
	wire led_green;
	wire led_yellow;

	reg  red_in;
	reg  green_in;
	reg  yellow_en;

	wire yellow_in;

	reg [1:0] state;
	reg [5:0] cnt;

	localparam	S_RED	 = 2'd0,
			S_GREEN	 = 2'd1,
			S_YELLOW = 2'd2;

	assign yellow_in = yellow_en & clk_1s;

	clk_gen_1s u_clk_gen_1s(clk_1s);

	led u_led_red(red_in, led_red);
	led u_led_green(green_in, led_green);
	led u_led_yellow(yellow_in, led_yellow);

	initial
	begin
		state = S_RED;
		cnt = 6'd0;
	end

	always@(posedge clk_1s)
	begin
		case(state)
			S_RED:
			begin
				if(cnt == 6'd29)
				begin
					state <= S_GREEN;
					cnt <= 6'd0;
				end
				else
					cnt <= cnt + 1'b1;
			end
			S_GREEN:
			begin
				if(cnt == 6'd29)
				begin
					state <= S_YELLOW;
					cnt <= 6'd0;
				end
				else
					cnt <= cnt + 1'b1;
			end
			S_YELLOW:
			begin
				if(cnt == 6'd9)
				begin
					state <= S_RED;
					cnt <= 6'd0;
				end
				else
					cnt <= cnt + 1'b1;
			end
			default:
			begin
				state <= S_RED;
				cnt <= 6'd0;
			end
		endcase
	end

	always@(*)
	begin
		red_in = (state == S_RED);
		green_in = (state == S_GREEN);
		yellow_en = (state == S_YELLOW);
	end

	initial
	begin
		$dumpfile("wave.vcd");
		$dumpvars();
		#150 $finish;
	end
endmodule
