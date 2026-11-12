`timescale 1ms / 1ms
module top_tb;
	wire clk_1s;
	wire r_in, g_in, y_in;
	wire r_out, g_out, y_out;
	integer timer;

	clk_gen_1s u_clk(clk_1s);
	led u_red(r_in, r_out);
	led u_green(g_in, g_out);
	led u_yellow(y_in, y_out);

	assign g_in = (timer <= 29);
	assign y_in = ((timer > 29 && timer <= 39)) ? clk_1s : 1'b0;
	assign r_in = (timer > 39);

	initial
		begin
			$dumpfile("done.vcd");
			$dumpvars();
			timer = 0;
			forever
				begin
					@(posedge clk_1s);
					timer = timer + 1;
					if (timer > 69)
						timer = 0;
				end
		end

	initial
		begin
			#150000 $finish();
		end
endmodule
