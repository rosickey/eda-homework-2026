module countre;
	wire clk;
	reg reset;
	reg inhibit;
	wire carry_a;
	wire carry_b;
	wire carry_c;
	wire[9:0] q_a;
	wire[9:0] q_b;
	clk_gen u_clk_gen(clk);
	cd4017  u_units(clk,reset,inhibit,carry_a,q_a);
	cd4017  u_tens(carry_c,reset,inhibit,carry_b,q_b);
	assign carry_c = ~carry_a;
	initial begin
		$dumpfile("HW03.vcd");
		$dumpvars();
		reset=1;
		inhibit=0;
		#20 reset=0;
		#2100 $finish;
	end
endmodule