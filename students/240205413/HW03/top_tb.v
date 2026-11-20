module top_tb; 
	wire clk;
	reg reset;
	reg inhibit;
	wire [0:9] q1, q2;
    wire carry_out1, carry_out2;
    wire clk_s;
	clk_gen u_clk(clk);
	cd4017 u_4017_f(clk,reset,inhibit,carry_out1,q1);
    cd4017 u_4017_s(clk_s,reset,inhibit,carry_out2,q2);
    
    assign clk_s = ~carry_out1;
    initial
	begin	
		reset=1;
		inhibit=0;
		#10 reset=0;
		$dumpfile("done");
		$dumpvars();
		#10000 $finish();
	end

endmodule