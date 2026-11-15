module top_tb;
		wire clk;
		wire [9:0] q;
		wire carry_out;
		wire led0,led1,led2,led3,led4,led5,led6,led7;
		reg reset;
		reg inhibit;

		clk_gen u_clk(clk);

		cd4017 u_cd4017(clk,reset,inhibit,carry_out,q);

		led u_led0(q[0],led0);
		led u_led1(q[1],led1);
		led u_led2(q[2],led2);
		led u_led3(q[3],led3);
		led u_led4(q[4],led4);
		led u_led5(q[5],led5);
		led u_led6(q[6],led6);
		led u_led7(q[7],led7);

		initial
		begin
				$dumpfile("top_tb.vcd");
				$dumpvars(0,top_tb);
				reset=1'b1;
				inhibit=1'b0;
				#10 reset=1'b0;
				#230 $finish;
		end
endmodule