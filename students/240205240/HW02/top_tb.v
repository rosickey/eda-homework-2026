module top_tb;
	wire clk_1s;
	wire red_out;
	wire yellow_out;
	wire green_out;
	wire yellow_in;
assign yellow_in = yellow_ctrl ? clk_1s:1'b0;
clk_gen_1s u_clk(clk_1s);
led u_red(red_ctrl,red_out);
led u_yellow(yellow_ctrl,yellow_out);
led u_green(green_ctrl,green_out);
reg[7:0] cnt;
initial begin
	$dumpfile("wave.vcd");
	$dumpvars();
	cnt=0;
	#70000 $finish;
end
always@(posedge clk_1s) begin
	cnt <=cnt+1'b1;
end
reg red_ctrl,yellow_ctrl,green_ctrl;
always @(posedge clk_1s) begin
red_ctrl<=1'b0;
green_ctrl<=1'b0;
yellow_ctrl<=1'b0;
	if(cnt<30) begin
red_ctrl<=1'b1;
end
	else if(cnt>=30 && cnt<60)begin
green_ctrl<=1'b1;
end
	else if(cnt>=60 && cnt<70)begin
yellow_ctrl<=1'b1;
	end
end
endmodule