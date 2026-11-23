module top_tb;
	wire clk;
	reg reset,inhibit;
wire [9:0] q_low;
wire carry_low;
wire [9:0] q_high;
wire carry_high;
clk_gen u_clk(clk);
cd4017 u_low(clk,reset,inhibit,carry_low,q_low);
cd4017 u_high(carry_low,reset,inhibit,carry_high,q_high);
initial begin
	$dumpfile("abc");
    	$dumpvars();
	reset=1'b1;
	inhibit=1'b1;
	#15 reset=0;
	#10inhibit=0;
 	#3000 $finish();
end
endmodule


