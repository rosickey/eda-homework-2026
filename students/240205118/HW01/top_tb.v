module top_tb;

	wire       clk;
	reg        reset;
	reg        inhibit;
	wire       carry_out;
	wire [9:0] q;
	wire [7:0] led;

	clk_gen u_clk_gen(.clk(clk));

	cd4017 u_cd4017(.clk(clk),.reset(reset),.inhibit(inhibit),.carry_out(carry_out),.q(q));

	LED u_led0(.clk(q[0]), .L(led[0]));
	LED u_led1(.clk(q[1]), .L(led[1]));
	LED u_led2(.clk(q[2]), .L(led[2]));
	LED u_led3(.clk(q[3]), .L(led[3]));
	LED u_led4(.clk(q[4]), .L(led[4]));
	LED u_led5(.clk(q[5]), .L(led[5]));
	LED u_led6(.clk(q[6]), .L(led[6]));
	LED u_led7(.clk(q[7]), .L(led[7]));

	initial begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0, top_tb);
	end

	initial begin
		reset   = 1'b1;
		inhibit = 1'b0;

		#25;
		reset = 1'b0;

		#500;
		$finish;
	end

endmodule