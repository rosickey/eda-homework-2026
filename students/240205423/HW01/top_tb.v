module test_led;
	wire clk;
	wire [7:0] led_out;
	 wire [7:0] led_clk;
	wire reset,inhibit,carry_out;
	wire [7:0] q;
	clk_gen u_clk(clk);
	assign reset =1'b0;
	assign inhibit =1'b0;
    	cd4017 u_cd4017(clk, reset, inhibit, carry_out, q);
    	led u_led0(led_clk[0],led_out[0]);
    	led u_led1(led_clk[1],led_out[1]);
    	led u_led2(led_clk[2],led_out[2]);
    	led u_led3(led_clk[3],led_out[3]);
    	led u_led4(led_clk[4],led_out[4]);
    	led u_led5(led_clk[5],led_out[5]);
    	led u_led6(led_clk[6],led_out[6]);
    	led u_led7(led_clk[7],led_out[7]);
     	assign led_clk=q[7:0]&{8{clk}};
    	initial
    	begin
        	$dumpfile("kk.vcd");  
        	$dumpvars(); 
        	#2000 $finish();
    	end
endmodule