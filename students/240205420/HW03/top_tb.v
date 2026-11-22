module top_tb;
     wire clk;
     reg reset;
     wire [9:0] q_ge;
     wire [9:0] q_shi;
     wire carry_ge;
     wire carry_shi;
     clk_gen u_clk(clk);
     cd4017 u_ge(clk, reset, 1'b0, carry_ge, q_ge);
     cd4017 u_shi(carry_ge, reset, 1'b0, carry_shi, q_shi);
     initial 
     begin
		$dumpfile("done");
		$dumpvars;
        	 reset = 1'b1;
        	 #20 reset = 1'b0;
         	#4000 $finish;
     end
endmodule
