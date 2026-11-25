module top_tb;

		wire clk;
		reg reset;
		reg inhibit;

		wire [9:0] q_low;
		wire carry_low;
		wire [9:0] q_high;
		wire carry_high;

		clk_gen u_clk(clk);
		cd4017 u_low(clk, reset, inhibit, carry_low, q_low);
		cd4017 u_high(carry_low, reset, inhibit, carry_high, q_high);

		initial begin
    					$dumpfile("wave.vcd");
    					$dumpvars(0,top_tb);
    		reset = 1'b1;
    		inhibit = 1'b1;
    		#400
    		reset = 1'b0;
    		inhibit = 1'b0;
    		#40000;
    		$finish;
end

initial begin
    $monitor("time=%0t, reset=%b, inhibit=%b, q_low=%b, q_high=%b",$time,reset,inhibit,q_low,q_high);
end

endmodule