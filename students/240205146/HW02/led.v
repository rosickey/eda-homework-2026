`timescale 1ms/1ms

module led(clk,led);
	input clk;
	output led;

	assign led = clk;
endmodule
