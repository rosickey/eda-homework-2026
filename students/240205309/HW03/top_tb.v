module top_tb;
wire clk;
reg reset_1,inhibit_1;
reg reset_2,inhibit_2;
wire carry_out_1;
wire [9:0] q_1;
wire [9:0] q_2;
clk_gen u_clk(clk);
cd4017 u_4017_1(clk,reset_1,inhibit_1,carry_out_1,q_1);
cd4017 u_4017_2(carry_out_1,reset_2,inhibit_2,carry_out_2,q_2);
initial
begin
	reset_1=1;
	reset_2=1;
	inhibit_1=0;
	inhibit_2=0;
	#10
	reset_1=0;
	reset_2=0;
end
initial begin
	$dumpfile("ok");
	$dumpvars();
end
endmodule
