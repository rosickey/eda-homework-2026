module led(clk,out);
			input clk;
			output out;
			wire clk;
			reg out;
		always@(posedge clk or negedge clk)
		begin
			out<=clk;
		end
endmodule	