module test_led;
	wire clk,carry_out;
	wire [9:0] q;
	wire led1,led2,led3,led4,led5,led6,led7,led8;
	reg inhibit;
	reg reset;
	clk_gen u_clk(clk);
	cd4017 u_cd4017(clk,reset,inhibit,carry_out,q);
		led u_led1(q[1],led1);
		led u_led2(q[2],led2);
		led u_led3(q[3],led3);
		led u_led4(q[4],led4);
		led u_led5(q[5],led5);
		led u_led6(q[6],led6);
		led u_led7(q[7],led7);
		led u_led8(q[8],led8);
	initial begin
	$dumpfile("done");
	$dumpvars();
	reset='b1;
	inhibit='b0;
	#10 reset='b0;
	#300 $finish;
	end
endmodule
		
	