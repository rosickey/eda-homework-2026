module top_tb;
wire clk;
wire led_g, led_y, led_r;
wire green, yellow, red;

reg [5:0] cnt;

clk_gen_1s u_clk(clk);

initial
	cnt = 6'd0;

always @(posedge clk)
begin
	if (cnt == 6'd34)
		$finish;
	else
		cnt <= cnt + 6'd1;
end

assign green = (cnt < 6'd15);
assign yellow = (cnt >= 6'd15) && (cnt < 6'd20) ? clk : 1'b0;
assign red = (cnt >= 6'd20);

led u_green(green, led_g);
led u_yellow(yellow, led_y);
led u_red(red, led_r);

initial
begin
	$dumpfile("top_tb.vcd");
	$dumpvars();
end
endmodule