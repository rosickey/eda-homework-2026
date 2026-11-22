module top_tb;
	wire clk;
	reg reset;
	reg inhibit;
	wire [9:0] q_low;
	wire [9:0] q_high;
	wire carry_out_low;
	wire carry_out_high;
	clk_gen u_clk_gen(clk);
	cd4017 u_cd4017_low(clk,reset,inhibit,carry_out_low,q_low);
	cd4017 u_cd4017_high(carry_out_low,reset,inhibit,carry_out_high,q_high);
	initial begin
		$dumpfile("done");
		$dumpvars();
		reset =1'b1;
		inhibit =1'b0;
		#20;
		reset =1'b0;
		#2000 $finish();
	end
endmodule