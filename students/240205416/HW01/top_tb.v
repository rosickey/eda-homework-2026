module top_tb;
	wire clk;
	wire [7:0] out;
	wire [7:0] led_clk;
	wire [7:0] q;
	wire carry_out;
	cd4017 u_cd4017(clk,carry_out,q);
	clk_gen u_clk_gen(clk);
	led u_led0(led_clk[0],out[0]);
	led u_led1(led_clk[1],out[1]);
	led u_led2(led_clk[2],out[2]);
	led u_led3(led_clk[3],out[3]);
	led u_led4(led_clk[4],out[4]);
	led u_led5(led_clk[5],out[5]);
	led u_led6(led_clk[6],out[6]);
	led u_led7(led_clk[7],out[7]);
	assign led_clk = q[7:0];
	initial
	begin
    		#200 $finish;
	end
	initial
	begin
    		$dumpfile("done");
   		$dumpvars();
	end
endmodule