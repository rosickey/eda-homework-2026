`timescale 1ns / 1ps

module top_tb;
    wire clk;
    reg reset;
    wire inhibit;
    wire tens_clk;
    wire carry_units;
    wire carry_tens;
    wire [9:0] q_units;
    wire [9:0] q_tens;
    wire [3:0] unit_count;
    wire [3:0] ten_count;

    assign inhibit = 1'b0;
    assign tens_clk = ~carry_units;

    initial begin
        reset = 1'b1;

        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);

        #20;
        reset = 1'b0;
        #2000;
        $finish;
    end

    clk_gen u_clk_gen(clk);
    cd4017 u_units(clk, reset, inhibit, carry_units, q_units);
    cd4017 u_tens(tens_clk, reset, inhibit, carry_tens, q_tens);

    assign unit_count = u_units.count;
    assign ten_count = u_tens.count;
endmodule
