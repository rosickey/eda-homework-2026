`timescale 1ns/1ps

module top_tb;

    reg reset;
    reg inhibit;
    wire clk;
    wire carry_out;
    wire [9:0] q;
    wire [7:0] led;

    clk_gen u_clk(.clk(clk));
    cd4017 u_4017(.clk(clk), .reset(reset), .inhibit(inhibit),
                  .carry_out(carry_out), .q(q));

    led u_led0(.clk(q[0]), .q(led[0]));
    led u_led1(.clk(q[1]), .q(led[1]));
    led u_led2(.clk(q[2]), .q(led[2]));
    led u_led3(.clk(q[3]), .q(led[3]));
    led u_led4(.clk(q[4]), .q(led[4]));
    led u_led5(.clk(q[5]), .q(led[5]));
    led u_led6(.clk(q[6]), .q(led[6]));
    led u_led7(.clk(q[7]), .q(led[7]));

    initial begin
        reset   = 1'b1;
        inhibit = 1'b1;
        #35 reset = 1'b0;
        #415 $finish;
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top_tb);
    end

endmodule
