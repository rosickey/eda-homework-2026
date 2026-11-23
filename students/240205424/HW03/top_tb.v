module top_tb;
	wire clk;
	wire reset,inhibit,carry_u,carry_t;
	wire [9:0] q_u;
	wire [9:0] q_t;
	clk_gen u_clk(clk);
	assign reset =1'b0;
	assign inhibit =1'b0;
    	cd4017 u_units(clk, reset, inhibit, carry_u, q_u);
    	cd4017 u_tens(carry_u, reset, inhibit, carry_t, q_t);
    	initial
    	begin
        	$dumpfile("o.vcd");  
        	$dumpvars(); 
        	#2100 $finish();
    	end
endmodule
