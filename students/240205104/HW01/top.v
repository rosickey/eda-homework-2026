module  top_tb;
               wire clk;
               wire carry_out;
              wire[9:0] q;
              wire led0,led1,led2,led3,led4,led5,led6,led7;
              reg reset;
              initial
              begin
                    reset = 1'b1;
                    #40 reset =1'b0;
             end
              clk_gen u_clk(clk);
              cd4017 u_cd4017(clk,reset,1'b0,carry_out,q);
              led u_led0(.din(q[0]),.led_out(led0));
              led u_led1(.din(q[1]),.led_out(led1));
              led u_led2(.din(q[2]),.led_out(led2));
              led u_led3(.din(q[3]),.led_out(led3));
              led u_led4(.din(q[4]),.led_out(led4));
              led u_led5(.din(q[5]),.led_out(led5));
              led u_led6(.din(q[6]),.led_out(led6));
              led u_led7(.din(q[7]),.led_out(led7));              
              initial
             begin
                     $dumpfile("top_tb.vcd");
                    $dumpvars();
                   #400 $finish;
           end
endmodule