module top_tb;
              wire clk;
              wire reset;
              wire [9:0] q0;
              wire [9:0] q1;
              wire carry0;
              wire carry1;
              reg reset_reg;
              assign reset=reset_reg;
              clk_gen u_gen(clk);
              cd4017 u_cd0(clk,reset,1'b0,carry0,q0);
              cd4017 u_cd1(clk,reset,carry0,carry1,q1);
              initial begin
                         reset_reg=1'b1;
                         #20;
                         reset_reg=1'b0;
              end
              initial begin
                         $dumpfile("done");
                         $dumpvars(0,top_tb);
                         #2000
                         $finish;
              end
endmodule