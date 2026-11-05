module tb_top;
    wire clk_sig;
    wire [9:0] q;
    wire l1,l2,l3,l4,l5,l6,l7,l8;
    reg rst;
    clk_gen u_clk(clk_sig);
    cd4017 u_cd4017(clk_sig,rst,1'b0,q);
    led_cathode u_led0(q[0], l1);
    led_cathode u_led1(q[1], l2);
    led_cathode u_led2(q[2], l3);
    led_cathode u_led3(q[3], l4);
    led_cathode u_led4(q[4], l5);
    led_cathode u_led5(q[5], l6);
    led_cathode u_led6(q[6], l7);
    led_cathode u_led7(q[7], l8);
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_top);
        $monitor("t=%0t,clk_sig=%b,l1=%b,l2=%b,l3=%b,l4=%b,l5=%b,l6=%b,l7=%b,l8=%b",
        $time, clk_sig, l1, l2, l3, l4, l5, l6, l7, l8);
        rst = 1'b1;
        #20 rst = 1'b0;
        #800 $finish;
    end
endmodule
