module top_tb;
		wire clk;
		 reg [6:0] cnt;
		wire red_led_in,green_led_in,yellow_led_in;
		wire red_out,green_out,yellow_out;
		clk_gen_1s u_clk_gen(clk);
		always @(posedge clk)
			begin
				if(cnt == 7'd69)
					begin
						cnt <= 7'd0;
					end
					else begin
						cnt <= cnt + 7'd1;
					end
			end
		assign red_led_in = (cnt >= 7'd0 && cnt <=7'd29) ? 1'b1 : 1'b0;
		assign green_led_in = (cnt >= 7'd30 && cnt <=7'd59) ? 1'b1 : 1'b0;
		assign yellow_led_in = (cnt >= 7'd60 && cnt <=7'd69) ? clk : 1'b0;
		led u_red(red_led_in, led_out);
		led u_green(green_led_in, green_out);
		led u_yellow(yellow_led_in, yellow_out);
		initial
		begin
				$dumpfile("done");
				$dumpvars;
				cnt = 7'd0;
				#140000 $finish();
		end
endmodule
