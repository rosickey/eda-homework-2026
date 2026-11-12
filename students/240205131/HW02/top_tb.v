`timescale 1s/1ms
module top_tb;
wire clk;
wire led_g, led_y, led_r;
wire green, yellow, red;

reg [6:0] cnt;

clk_gen_1s u_clk(clk);

initial
	cnt = 7'd0;

always @(posedge clk)
begin
	if (cnt == 7'd69)
		cnt <= 7'd0;
	else
		cnt <= cnt + 7'd1;
end

assign green = (cnt < 7'd30);
assign yellow = (cnt >= 7'd30) && (cnt < 7'd40) ? clk : 1'b0;
assign red = (cnt >= 7'd40);

led u_green(green, led_g);
led u_yellow(yellow, led_y);
led u_red(red, led_r);

initial
begin
	$dumpfile("top_tb.vcd");
	$dumpvars();
	#70 $finish;
end
endmodule