module top_tb;
    wire clk;
    wire rst;
    wire [9:0] q;
    wire led0, led1, led2, led3, led4, led5, led6, led7;

    clk_gen u1(clk);
    cd4017 u2(clk, rst, q);
    led u3(q[0], led0);
    led u4(q[1], led1);
    led u5(q[2], led2);
    led u6(q[3], led3);
    led u7(q[4], led4);
    led u8(q[5], led5);
    led u9(q[6], led6);
    led u10(q[7], led7);

    initial begin
        rst = 1'b1;
        #5 rst = 1'b0;
        #200 $stop;
    end
endmodule
