`timescale 1ns/1ns

module tob_tb;
    wire clk;
    reg reset;
    wire carry_out;
    wire [9:0] q;
    wire [7:0] led_out;

    clk_gen u_clk_gen (
        .clk(clk)
    );

    cd4017 u_cd4017 (
        .clk(clk),
        .reset(reset),
        .inhibit(1'b0),
        .carry_out(carry_out),
        .q(q)
    );

    led u_led0 (
        .clk(q[0]),
        .led(led_out[0])
    );

    led u_led1 (
        .clk(q[1]),
        .led(led_out[1])
    );

    led u_led2 (
        .clk(q[2]),
        .led(led_out[2])
    );

    led u_led3 (
        .clk(q[3]),
        .led(led_out[3])
    );

    led u_led4 (
        .clk(q[4]),
        .led(led_out[4])
    );

    led u_led5 (
        .clk(q[5]),
        .led(led_out[5])
    );

    led u_led6 (
        .clk(q[6]),
        .led(led_out[6])
    );

    led u_led7 (
        .clk(q[7]),
        .led(led_out[7])
    );

    initial begin
        reset = 1'b1;
        #1 reset = 1'b0;

        $dumpfile("tob_tb.vcd");
        $dumpvars(0, tob_tb);

        #200 $finish;
    end
endmodule