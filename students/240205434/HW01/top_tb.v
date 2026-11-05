`timescale 1ns/1ps

module top_tb;
    reg clr;
    wire clk;
    wire cout;
    wire [7:0] q;
    wire [7:0] led;

    clk_gen u_clk (.clk(clk));
    cd4017 u_cd4017 (.clk(clk), .ce(1'b0), .clr(clr), .cout(cout), .q(q));

    led u_led0 (.clk(q[0]), .led(led[0]));
    led u_led1 (.clk(q[1]), .led(led[1]));
    led u_led2 (.clk(q[2]), .led(led[2]));
    led u_led3 (.clk(q[3]), .led(led[3]));
    led u_led4 (.clk(q[4]), .led(led[4]));
    led u_led5 (.clk(q[5]), .led(led[5]));
    led u_led6 (.clk(q[6]), .led(led[6]));
    led u_led7 (.clk(q[7]), .led(led[7]));

    initial begin
        clr = 1'b1;
        #35 clr = 1'b0;
        #365 $finish;
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top_tb);
    end
endmodule
