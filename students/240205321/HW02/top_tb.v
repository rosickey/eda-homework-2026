`timescale 1s/1ms

module top_tb;
		wire clk;
		wire led_red,led_yellow,led_green;
		reg red_in,yellow_in,green_in;
		reg [6:0] cnt;
		clk_gen_1s u_clk_gen_1s(clk);
		led u_led_red(red_in,led_red);
		led u_led_yellow(yellow_in,led_yellow);
		led u_led_green(green_in,led_green);
		always@(posedge clk)
		begin
			if(cnt==69)
				cnt<=0;
			else
				cnt<=cnt+1;
		end
		always@(*)
		begin
			red_in=0;
			yellow_in=0;
			green_in=0;
			if(cnt<30)
				green_in=1;
			else if(cnt<40)
				yellow_in=clk;
			else
				red_in=1;
		end

		initial
		begin
			$dumpfile("top_tb.vcd");
			$dumpvars(0,top_tb);
			cnt=0;
			#70 $finish;
		end

endmodule
