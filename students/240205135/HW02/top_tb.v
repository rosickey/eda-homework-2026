`timescale 1s/1ms

module top_tb;
	wire clk,q_g,q_y,q_r;
	wire yellow;
	reg green,red;
	reg [1:0] counta;
	reg [4:0] num;

	clk_gen_1s u_clk(clk);
	led u_green(green,q_g);
	led u_yellow(yellow,q_y);
	led u_red(red,q_r);

	assign yellow = (counta==2) && clk;

	always@(posedge clk)
	begin
		if(num>1)
			num <= num - 1;
		else
		begin
			case(counta)
				1: begin 
					green <= 0;
					red <= 0;
					counta <= 2;
					num <= 10;
				end
				2: begin 
					green <= 0;
					red <= 1;
					counta <= 3;
					num <= 30;
				end
				3: begin 
					green <= 1;
					red <= 0;
					counta <= 1;
					num <= 30;
				end
				default: begin
					green <= 1;
					red <= 0;
					counta <= 1;
					num <= 30;
				end
			endcase
		end
	end

	initial
	begin
		$dumpfile("done");
		$dumpvars();
		green = 1;
		red = 0;
		counta = 1;
		num = 30;
		#140 $finish;
	end
endmodule