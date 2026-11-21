module top_tb;
	wire       clk_wire;
	wire       carry_out_wire;
	wire [9:0] q_wire;

	wire led_out_0, led_out_1, led_out_2, led_out_3;
	wire led_out_4, led_out_5, led_out_6, led_out_7;

	reg  reset_reg;

	initial
	begin
		reset_reg = 1'b1;
		#25 reset_reg = 1'b0;
	end

	clk_gen u_clk_gen(clk_wire);

module led(clk,out);
    input  clk;
    output out;
	assign out = clk;
endmodule