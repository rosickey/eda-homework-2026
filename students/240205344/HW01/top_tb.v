module top_tb;
	wire       clk_wire;
	wire [7:0] q_wire;
	wire [7:0] out_wire;

	reg reset;
	reg inhibit;

	clk_gen u_clk_gen(clk_wire);
	cd4017 u_cd4017(clk_wire, reset, inhibit, , q_wire);

	led u_led0(q_wire[0], out_wire[0]);
	led u_led1(q_wire[1], out_wire[1]);
	led u_led2(q_wire[2], out_wire[2]);
	led u_led3(q_wire[3], out_wire[3]);
	led u_led4(q_wire[4], out_wire[4]);
	led u_led5(q_wire[5], out_wire[5]);
	led u_led6(q_wire[6], out_wire[6]);
	led u_led7(q_wire[7], out_wire[7]);

	initial
	begin
		$dumpfile("wave.vcd");
		$dumpvars(0, top_tb);

		reset   = 1'b1;
		inhibit = 1'b0;
		#20 reset = 1'b0;
		#200 $finish;
	end
endmodule
