module top_tb;
	wire clk;
	reg reset;
	reg inhibit;
	wire [9:0] q1;  
	wire [9:0] q2;  
	wire carry_out1;
	wire carry_out2;
	wire clk_s;
	clk_gen u_clk(clk);
	cd4017 u_ones(clk, reset, inhibit, carry_out1, q1);
	cd4017 u_tens(clk_s, reset, inhibit, carry_out2, q2);
	assign clk_s = ~carry_out1;
	initial begin
		reset = 1'b1;
		inhibit = 1'b0;
		#10 reset = 1'b0;
		$dumpfile("ok");
		$dumpvars();
		#10000 $finish();
    	end
endmodule