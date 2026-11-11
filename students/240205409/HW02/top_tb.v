`timescale 1ms/1ms
module top_tb;
	wire clk;
	reg clk_1s;
	reg red,green,yellow;
	wire led_red,led_green,led_yellow;
	reg[6:0] cnt;
	reg[1:0] state;
	clk_gen_1s u_clk_gen(clk);
	led u_led_red(red,led_red);
	led u_led_green(green,led_green);
	led u_led_yellow(yellow,led_yellow);
	always @( clk)begin;
 		case(state)
			2'b00:begin
				red<=1;
				green<=0;
				yellow<=0;
				if(cnt==7'd119)
				begin
					state<=2'b01;
					cnt<=0;
				end
				else begin
					cnt<=cnt+1;
				end
			end
			2'b01:begin
				red<=0;
				green<=1;
				yellow<=0;
				if(cnt==7'd119)
				begin
					state<=2'b10;
					cnt<=0;
				end
				else begin
					cnt<=cnt+1;
				end
			end
			2'b10:begin
				red<=0;
				green<=0;
				if(clk_1s==0)
					yellow<=!yellow;
				if(cnt==7'd39)
				begin
					state<=2'b00;
					cnt<=0;
				end
				else begin
					cnt<=cnt+1;
					clk_1s<=!clk;
				end
			end
		endcase
	end
initial begin
		$dumpfile("done");
		$dumpvars();
	end
initial begin
	state=2'b00;
	clk_1s=0;
	cnt=0;
	red=0;
	green=0;
	yellow=0;
	#1000000000 $finish;
        end
endmodule