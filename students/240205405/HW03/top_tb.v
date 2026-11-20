module top_tb;
		wire clk;
		wire [9:0] q_unit,q_ten;
		wire carry_unit,carry_ten;
		wire inhibit_ten;
		reg reset;

		assign inhibit_ten=~carry_unit;

		clk_gen u_clk(clk);
		cd4017 u_unit(clk,reset,1'b0,carry_unit,q_unit);
		cd4017 u_ten(clk,reset,inhibit_ten,carry_ten,q_ten);

		initial
		begin
			$dumpfile("wave.vcd");
			$dumpvars(0,top_tb);
			reset=1'b1;
			#15 reset=1'b0;
			#2050 $finish;
		end

		initial
		begin
			$monitor("time=%0t q_unit=%b q_ten=%b carry_unit=%b",$time,q_unit,q_ten,carry_unit);
		end
endmodule