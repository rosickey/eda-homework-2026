`timescale 1s/1ms
module top_tb;
	wire clk;
	wire red, yellow, green;
	clk_gen_1s u_clk(clk);
	led u_led(clk,red,green,yellow);
	initial begin
		#75 $finish;
	end 
	initial 
	begin 
		$dumpfile("done");
		$dumpvars();
	end
endmodule
