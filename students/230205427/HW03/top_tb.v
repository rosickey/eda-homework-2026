`timescale 1ns / 1ns

module top_tb;

    wire       clk;
    reg        reset;

    wire       ones_carry;
    wire [9:0] ones_q;
    wire       tens_carry;
    wire [9:0] tens_q;

    clk_gen u_clk_gen (
        .clk (clk)
    );

    cd4017 u_ones (
        .clk       (clk),
        .reset     (reset),
        .inhibit   (1'b0),
        .carry_out (ones_carry),
        .q         (ones_q)
    );

    cd4017 u_tens (
        .clk       (ones_carry),
        .reset     (reset),
        .inhibit   (1'b0),
        .carry_out (tens_carry),
        .q         (tens_q)
    );

    initial begin
        reset = 1'b1;

        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);

        #1    reset = 1'b0;
        #21000 $finish;
    end

endmodule
