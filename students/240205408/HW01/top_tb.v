module test_led;
	wire clk;
	wire [7:0] out;
	wire [9:0] q;
	reg reset;
	reg inhibit;
	clk_gen u_clk(clk);
	cd4017 u_4017(clk,reset,inhibit,cout,q);

	LED u_led0(q[0], out[0]);
	LED u_led1(q[1], out[1]);
	LED u_led2(q[2], out[2]);
	LED u_led3(q[3], out[3]);
 	LED u_led4(q[4], out[4]);
	LED u_led5(q[5], out[5]);
    	LED u_led6(q[6], out[6]);
    	LED u_led7(q[7], out[7]);

 	initial begin
		reset=1'b1;
		inhibit=1'b1;
		#20
		reset=1'b0;
		inhibit=1'b0;
        	#200;
		$finish;
    	end
    	initial begin
        	$dumpfile("wave.vcd");
        	$dumpvars();
    	end
endmodule
