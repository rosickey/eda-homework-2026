module top_tb;
	wire clk;
	reg reset;
	reg inhibit;
	wire carry_out;
	wire [9:0] q;
	wire [7:0] out;

	clk_gen u_clk(clk);
	cd4017 u_cd4017(clk, reset, inhibit, carry_out, q);

	led u_led0(q[0], out[0]);
	led u_led1(q[1], out[1]);
	led u_led2(q[2], out[2]);
	led u_led3(q[3], out[3]);
	led u_led4(q[4], out[4]);
	led u_led5(q[5], out[5]);
	led u_led6(q[6], out[6]);
	led u_led7(q[7], out[7]);

	initial
	begin
		$dumpfile("top.vcd");
		$dumpvars(0, top_tb);
		reset = 1;
		inhibit = 0;
		#10 reset = 0;
		#200 $finish();
	end
endmodule
