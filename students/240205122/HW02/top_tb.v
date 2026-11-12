`timescale 1ms/1ms

module top_tb;
	wire clk;
	wire red,green,yellow;
	wire q_r,q_g,q_y;
	reg reset;
	reg [6:0] count;

	clk_gen_1s u_clk(clk);
	led u_red(red,q_r);
	led u_green(green,q_g);
	led u_yellow(yellow,q_y);

	always@(negedge clk or posedge reset)
	begin
		if(reset)
			count <= 7'd0;
		else if(count==7'd69)
			count <= 7'd0;
		else
			count <= count + 1;
	end

	assign green = count < 7'd30;
	assign yellow = (count >= 7'd30) && (count < 7'd40) && !clk;
	assign red = (count >= 7'd40);

	initial
	begin
		$dumpfile("done");
		$dumpvars();
		count = 7'd0;
		reset = 1;
		#1 reset = 0;
		#140000 $finish;
	end
endmodule