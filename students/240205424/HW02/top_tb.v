`timescale 1ms/1ms
module top_tb;
		wire clk;
		reg red_in,yellow_in,green_in;
		wire red,yellow,green;
		reg [7:0] cnt;
		clk_gen_1s u_clk_gen_1s(clk);
		led u_led_red(red_in,red);
		led u_led_yellow(yellow_in,yellow);
		led u_led_green(green_in,green);
		initial
				cnt=0;
		always @(posedge clk or negedge clk)
				if (cnt==8'd139)
						cnt<=0;
				else
						cnt<=cnt+1'b1;
		always @(*)
		begin
				red_in=(cnt<8'd60);
				green_in=(cnt>=8'd60)&&(cnt<8'd120);
				yellow_in=(cnt>=8'd120)&&(~cnt[0]);
		end
		initial
		begin
				$dumpfile("done.vcd");
				$dumpvars(0,top_tb);
				#150000 $finish;
		end
endmodule
