module led(clk,led_out);
	input clk;
	output led_out;
	reg led_out;
	always @(*)
    	led_out <= clk&clk;
endmodule
