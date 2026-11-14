`timescale 100ms/1ms
module top_tb;
	wire clk;
	wire red,yellow,green;
	wire red_in,yellow_in,green_in;
	reg [6:0] cnt;

	clk_gen_1s u_clk_gen_1s(clk);
	led u_led_red(red_in,red);
	led u_led_yellow(yellow_in,yellow);
	led u_led_green(green_in,green);

	always@(negedge clk)
	begin
		if(cnt==7'd69)
			cnt<=7'd0;
		else
			cnt<=cnt+1'b1;
	end

	assign green_in=(cnt<7'd30);
	assign yellow_in=((cnt>=7'd30)&&(cnt<7'd40))?clk:1'b0;
	assign red_in=(cnt>=7'd40);

	initial
	begin
		cnt=0;
		$dumpfile("hw02.vcd");
		$dumpvars(0,top_tb);
		#700 $finish;
	end
endmodule
