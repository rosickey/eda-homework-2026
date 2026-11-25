module top_tb;
	wire clk_signal;
	wire low_carry;
	wire high_carry;
	wire [9:0] q_low;
	wire [9:0] q_high;
	wire high_clk;
	reg rst;
	reg en;
	clk_gen clk_source(clk_signal);
	cd4017 counter_low(clk_signal,rst,en,low_carry,q_low);
		assign high_clk = ~low_carry;
	cd4017 counter_high(high_clk,rst,en,high_carry,q_high);
		initial begin
				$dumpfile("waveform.vcd");
				$dumpvars(0, top_tb);
				rst = 1'b1;
				en = 1'b0;
				#15 rst = 1'b0;
				#500 $finish;
			end
endmodule

