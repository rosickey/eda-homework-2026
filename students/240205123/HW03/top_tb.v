`timescale 1ns/1ns

module top_tb;
    wire clk;
    reg reset;
    wire ones_carry_out;
    wire tens_carry_out;
    wire [9:0] ones_q;
    wire [9:0] tens_q;

    clk_gen u_clk_gen (clk);

    cd4017 u_ones (clk, reset, 1'b0, ones_carry_out, ones_q);

    cd4017 u_tens (ones_carry_out, reset, 1'b0, tens_carry_out, tens_q);

    initial begin
        reset = 1'b1;

        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);

        #1 reset = 1'b0;
        #2000 $finish;
    end
endmodule
