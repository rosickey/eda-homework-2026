`timescale 1s/1ns
module top_tb;
		wire clk_1s;
		wire red_out,yellow_out,green_out;
		reg[6:0] cnt;
		reg red_in,yellow_in,green_in;
		clk_gen_1s u_clk(clk_1s);
		always@(posedge clk_1s) begin	
		if(cnt>=7'd69)
			cnt<=7'd0;
		else
			cnt<=cnt+7'd1;
end
		always@(*) begin
		red_in=1'b0;
		yellow_in=1'b0;
		green_in=1'b0;
		if(cnt>=7'b0 && cnt<=7'd29) begin
			green_in=1'b1;
		end
		else if(cnt>=7'd30 && cnt<=7'd39) begin
			yellow_in=clk_1s;
		end
		else if(cnt>=7'd40 && cnt<=7'd69) begin
			red_in=1'b1;
		end
end
		led u_red(red_in,red_out);
		led u_yellow(yellow_in,yellow_out);
		led u_green(green_in,green_out);
		initial begin
			cnt=7'd0;
		end


		initial begin
			$dumpfile("3led");
			$dumpvars();
			#500 $finish;
end
endmodule
