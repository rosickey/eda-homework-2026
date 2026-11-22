`timescale 1ms / 1ms
module top_tb;
	wire clk_1s;
	wire clk_ten;
	reg reset;
	wire carry_ones, carry_tens;
	wire [9:0] q_ones, q_tens;

	clk_gen_1s u_clk(clk_1s);
	cd4017 u_ones(clk_1s, reset, 1'b0, carry_ones, q_ones);
	cd4017 u_tens(clk_ten, reset, 1'b0, carry_tens, q_tens);

	assign clk_ten = ~carry_ones;

	initial
		begin
			reset = 1;
			#1200 reset = 0;
		end

	initial
		begin
			$dumpfile("done.vcd");
			$dumpvars();
		end

	initial
		begin
			#101000 $finish();
		end

	always @(posedge clk_1s)
		$strobe("time=%0t  %0d%0d", $time, u_tens.count, u_ones.count);
endmodule
