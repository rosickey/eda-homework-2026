`timescale 1s/1ms
module top_tb;
			wire clk;
			reg red_in, yellow_in, green_in;
			wire red, yellow, green;
			reg [5:0] cnt;

			clk_gen_1s u_clk(clk);

			led u_red(red_in,red);
			led u_yellow(yellow_in, yellow);
			led u_green (green_in,  green);

			always @(posedge clk)
			begin
				if (cnt == 6'd39)
					cnt <= 6'd0;
				else
					cnt <= cnt + 1'b1;
			end

			always @(posedge clk)
			begin
			case (cnt)
			6'd0: begin
				red_in    <= 1'b1;
				yellow_in <= 1'b0;
				green_in  <= 1'b1;
			end
			6'd30: begin
				red_in<= 1'b0;
				green_in<= 1'b0;
			end
			default: ;
		endcase

			if (cnt >= 6'd30 && cnt < 6'd40)
				yellow_in <= clk;
			end

			initial
			begin
				$dumpfile("done.vcd");
				$dumpvars();
				cnt= 6'd0;
				red_in=1'b1;
				yellow_in=1'b0;
				green_in=1'b1;
				#120 $finish;
	end
endmodule
