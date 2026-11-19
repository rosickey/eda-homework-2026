module test_led;
		wire clk;
		wire[9:0] B;
		wire[7:0] q;
		wire[7:0] led_clk;
		reg reset;
		reg inhibit;
		clk_gen u_clk(clk);
		led u_led(clk,out);
		cd4017 u_4017(clk,reset,inhibit,carry_out,q);
		led u_led0(led_clk[0],B0);
		led u_led1(led_clk[1],B1);
		led u_led2(led_clk[2],B2);
		led u_led3(led_clk[3],B3);
		led u_led4(led_clk[4],B4);
		led u_led5(led_clk[5],B5);
		led u_led6(led_clk[6],B6);
		led u_led7(led_clk[7],B7);
		assign led_clk=q[9:0];
		initial
		begin
				reset=1;
				inhibit=0;
				#10 reset=0;
				#200 $finish();
		end
		initial
		begin
				$dumpfile("done");
				$dumpvars();
		end
endmodule