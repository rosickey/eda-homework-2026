module two();
wire clk;
reg  reset;
wire inhibit;
wire carry_unit, carry_ten;
wire [9:0] q_unit, q_ten;
clk_gen u_clk_gen(clk);
	cd4017 u_unit(clk,        reset, inhibit, carry_unit, q_unit);
	cd4017 u_ten (carry_unit, reset, inhibit, carry_ten,  q_ten);
	assign inhibit = 1'b0;
		initial
		begin
			$dumpfile("ten24017");
			$dumpvars();
				reset = 1'b1;
				#5 reset = 1'b0;
		end
		initial 
		begin
		#250;
		$finish;
		end
		endmodule