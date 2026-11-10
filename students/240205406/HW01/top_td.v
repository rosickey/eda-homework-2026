module td_led8;
	wire clk;
	wire[9:0] q;
	reg reset,inhibit;
	wire[7:0] out;
	wire carry_out;
cd4017 u_4017(clk,reset,inhibit,carry_out,q);
led u1(q[0],out[0]);
led u2(q[1],out[1]);
led u3(q[2],out[2]);
led u4(q[3],out[3]);
led u5(q[4],out[4]);
led u6(q[5],out[5]);
led u7(q[6],out[6]);
led u8(q[7],out[7]);
clk_gen u_clk(clk);
initial begin 
		$dumpfile("8led");
		$dumpvars();
		reset=1;
		inhibit=1;
		#10 reset=0;inhibit=0;
#500 $finish();
end 
endmodule









