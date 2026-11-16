module test_8led;
	wire clk;
	wire [0:7] out;
	reg  [0:7] led_clk;
	reg reset;
	reg inhibit;
	wire [0:9] q;
	clk_gen u_clk(clk);
	cd4017 u_4017(clk,reset,inhibit,carry_out,q);
	led u_led0(led_clk[0],out[0]);
	led u_led1(led_clk[1],out[1]);
	led u_led2(led_clk[2],out[2]);
	led u_led3(led_clk[3],out[3]);
	led u_led4(led_clk[4],out[4]);
	led u_led5(led_clk[5],out[5]);
	led u_led6(led_clk[6],out[6]);
	led u_led7(led_clk[7],out[7]);
	always@(posedge clk)
	begin
		led_clk[0:7]<=q[0:7];
		
	end
	initial
	begin	
		led_clk<=8'b0000_0001;
		reset=1;
		inhibit=0;
		#10 reset=0;
		$dumpfile("done");
		$dumpvars();
		#1000 $finish();
	end
endmodule