module  top_tb;
               wire clk;
              wire[9:0] q;
              wire [7:0] led_out;
              reg rst_pulse;
              wire reset;
              assign reset = rst_pulse | q[8];
             
              clk_gen u_clk(clk);
              cd4017 u_cd4017(clk,reset,1'b0, ,q);
              led u_led0(q[0],led_out[0]);
              led u_led1(q[1],led_out[1]);
              led u_led2(q[2],led_out[2]);
              led u_led3(q[3],led_out[3]);
              led u_led4(q[4],led_out[4]);
              led u_led5(q[5],led_out[5]);
              led u_led6(q[6],led_out[6]);
              led u_led7(q[7],led_out[7]);            
              initial
             begin
                     $dumpfile("top_tb.vcd");
                    $dumpvars;
             end
            
            initial begin 
                      rst_pulse = 1'b1;
                      #35 rst_pulse = 1'b0;
                   #175 $finish;
           end
endmodule