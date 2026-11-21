module top_tb;
	wire clk;
	wire [1:0]	clk_4017;
	wire [0:1]	carry_out;
	wire [9:0]	q[0:1];
	reg reset;
	reg inhibit;
	clk_gen u_clk(clk);
	cd4017 u_4017_0(clk_4017[0], reset, inhibit, carry_out[0], q[0]);
	cd4017 u_4017_1(clk_4017[1], reset, inhibit, carry_out[1], q[1]);
	assign clk_4017[0] = clk;
	assign clk_4017[1] = ~carry_out[0];
	initial
	begin
		$dumpfile("ok");
		$dumpvars();
		reset   = 1'b1;
		inhibit = 1'b0;
		#15 reset = 1'b0;
		#500 $finish;
	end
endmodule