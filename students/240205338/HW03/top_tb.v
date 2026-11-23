module top_tb;
	wire clk;
	wire [9:0] q_ones, q_tens;
	wire carry_ones, carry_tens;
	reg reset;

	clk_gen u_clk(clk);

	cd4017 u_ones(clk, reset, 1'b0, carry_ones, q_ones);

	cd4017 u_tens(~carry_ones, reset, 1'b0, carry_tens, q_tens);

	initial 
	begin
	$dumpfile("hw3.vcd");
        $dumpvars();
		reset = 1'b1;
		#15 reset = 1'b0;
		#2200 $finish;
	end
endmodule
