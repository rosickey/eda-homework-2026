module top_tb;
               wire clk,carry_out;
               reg reset,inhibit;
               wire [9:0] q;
               wire led0,led1,led2,led3,led4,led5,led6,led7;
               wire li0=q[0]&clk,li1=q[1]&clk,li2=q[2]&clk,li3=q[3]&clk;
               wire li4=q[4]&clk,li5=q[5]&clk,li6=q[6]&clk,li7=q[7]&clk;
               clk_gen u_clk(clk);
               cd4017 u_4017(clk,reset,inhibit,carry_out,q);
               cdLED u_LED0(.clk(li0),.out(led0));
               cdLED u_LED1(.clk(li1),.out(led1));
               cdLED u_LED2(.clk(li2),.out(led2));
               cdLED u_LED3(.clk(li3),.out(led3));
               cdLED u_LED4(.clk(li4),.out(led4));
               cdLED u_LED5(.clk(li5),.out(led5));
               cdLED u_LED6(.clk(li6),.out(led6));
               cdLED u_LED7(.clk(li7),.out(led7));             
               initial begin
                          $monitor("t=%0t clk=%b q=%b led=%b%b%b%b%b%b%b%b",$time,clk,q,led7,led6,led5,led4,led3,led2,led1,led0);
                          $dumpfile("done.vcd");
                          $dumpvars(0,test_8led); 
               end
               initial begin
                         reset=1;inhibit=0;
                         #15 reset=0;
                         #400 $finish;
              end 
endmodule