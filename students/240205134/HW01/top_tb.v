module top_tb;

	wire       clk_wire;
	reg        reset_reg;
	wire       reset_wire;
	wire       inhibit_wire;
	wire       carry_out_wire;
	wire [9:0] q_wire;
	wire       led_out_0;
	wire       led_out_1;
	wire       led_out_2;
	wire       led_out_3;
	wire       led_out_4;
	wire       led_out_5;
	wire       led_out_6;
	wire       led_out_7;

	clk_gen u_clk_gen(clk_wire);

	cd4017 u_cd4017(clk_wire, reset_reg, inhibit_wire, carry_out_wire, q_wire);

	led u_led0(q_wire[0], led_out_0);
	led u_led1(q_wire[1], led_out_1);
	led u_led2(q_wire[2], led_out_2);
	led u_led3(q_wire[3], led_out_3);
	led u_led4(q_wire[4], led_out_4);
	led u_led5(q_wire[5], led_out_5);
	led u_led6(q_wire[6], led_out_6);
	led u_led7(q_wire[7], led_out_7);

	assign reset_wire   = reset_reg;
	assign inhibit_wire = 1'b0;

	initial begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0, top_tb);
	end

	initial begin
		reset_reg = 1'b1;

		#25;
		reset_reg = 1'b0;

		#500;
		$finish;
	end

endmodule
