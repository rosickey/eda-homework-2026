`timescale 1ms / 1ms
module top_tb;
	wire clk_1s;
	reg r_in, g_in;
	wire y_in;
	wire r_out, g_out, y_out;
	integer timer;
	clk_gen_1s clk_gen_1s_inst (clk_1s);
		led led_red (r_in, r_out);
		led led_green (g_in, g_out);
		led led_yellow (y_in, y_out);
	assign y_in= ((timer > 30 && timer <= 40)||(timer > 70 && timer <= 80)) ? clk_1s : 1'b0;
	initial
		begin
			$dumpfile("test");
			$dumpvars(0,top_tb);
			timer = 0;
			r_in = 0;
			g_in = 0;
			#10; 
			forever
				begin
					@(posedge clk_1s); 
					timer = timer + 1;
					if (timer > 0 && timer <= 30) 
						begin
							r_in = 1'b1;
							g_in = 1'b0;
						end
							else if (timer > 30 && timer <= 40)
								begin
									r_in = 1'b0;
									g_in = 1'b0;
								end
									else if (timer > 40 && timer <= 70)
										begin
											r_in = 1'b0;
											g_in = 1'b1;
										end
										else if (timer > 70 && timer <= 80)
											begin
												r_in = 1'b0; 
												g_in = 1'b0; 
											end
												else if (timer > 80)
													begin
														timer = 1;
														r_in = 1'b1;
														g_in = 1'b0;
													end
				end
		end
	initial
		begin
			#160000 $finish();
		end
endmodule





