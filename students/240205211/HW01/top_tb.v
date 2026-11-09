module top_tb;
wire clk;
reg reset;
reg inhibit;
wire [0:7] out;
reg[0:7]led_clk;
wire [0:9] q;
clk_gen u_clk_gen (clk);
cd4017 u_cd4017 (clk, reset, inhibit, carry_out, q);
led u_led (led_clk[0], out[0]);
led u_led (led_clk[1], out[1]);
led u_led (led_clk[2], out[2]);
led u_led (led_clk[3], out[3]);
led u_led (led_clk[4], out[4]);
led u_led (led_clk[5], out[5]);
led u_led (led_clk[6], out[6]);
led u_led (led_clk[7], out[7]);
always@(posedge clk)
begin
led _clk[0:7] <= q[0:7];
end
initial 
begin
	led clk <= 8'b0000 0001;
    	reset=1;
    	inhibit=0
    	#10 reset=0;
   	 $dumpfile("ok");
   	 $dumpvars();
end
endmodule