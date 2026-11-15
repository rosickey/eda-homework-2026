module test;
wire clk;
wire [7:0] led_out;
reg [7:0] shift;

clk_gen u_clk(clk);

led u0(clk, led_out[0]);
led u1(clk, led_out[1]);
led u2(clk, led_out[2]);
led u3(clk, led_out[3]);
led u4(clk, led_out[4]);
led u5(clk, led_out[5]);
led u6(clk, led_out[6]);
led u7(clk, led_out[7]);

initial begin
	shift = 8'b00000001;
	$dumpfile("wave.vcd");
	$dumpvars(0, test);
end

always @(posedge clk) begin
	shift <= {shift[6:0], shift[7]};
end

initial begin
	#400 $finish;
end

endmodule
