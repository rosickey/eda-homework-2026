module top_tb;
	wire clk;
	wire carry_out;
	wire [9:0] q;
	wire q0_out,q1_out,q2_out,q3_out,q4_out,q5_out,q6_out,q7_out;
	reg reset;
	reg inhibit;

	clk_gen u_clk_gen(clk);

	cd4017 u_cd4017(clk,reset,inhibit,carry_out,q);

	led u_led0(q[0],q0_out);
	led u_led1(q[1],q1_out);
	led u_led2(q[2],q2_out);
	led u_led3(q[3],q3_out);
	led u_led4(q[4],q4_out);
	led u_led5(q[5],q5_out);
	led u_led6(q[6],q6_out);
	led u_led7(q[7],q7_out);

	initial
	begin
		$dumpfile("wave.vcd");
		$dumpvars(0, top_tb);
		reset=1'b1;
		inhibit=1'b0;
		#20 reset=1'b0;
		#500 $finish;
	end
endmodule
