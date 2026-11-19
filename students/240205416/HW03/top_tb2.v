module top_tb;
	wire clk;
	wire carry0;
	wire [9:0] q0;
	wire carry1;
	wire [9:0] q1;
	clk_gen u_clk(clk);
	cd4017 u_a4017(clk,carry0,q0);
	cd4017 u_b4017(carry0,carry1,q1);
	initial begin
   		$dumpfile("done");
    		$dumpvars();
   		#2000;
    		$finish;
	end
endmodule
