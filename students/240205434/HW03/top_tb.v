`timescale 1ns/1ps

module top_tb;
    wire clk, carry_ones, carry_tens;
    wire [9:0] q_ones, q_tens;
    wire clk_tens;
    reg reset;
    integer step;
    integer expected;

    clk_gen u_clk (clk);
    cd4017 u_ones (clk, reset, 1'b1, carry_ones, q_ones);
    cd4017 u_tens (clk_tens, reset, 1'b1, carry_tens, q_tens);

    // carry_ones is high at 9. Its falling edge clocks the tens digit.
    assign clk_tens = ~carry_ones;

    task check_count;
        input integer value;
        reg [9:0] expected_ones, expected_tens;
        begin
            expected_ones = 10'b1 << (value % 10);
            expected_tens = 10'b1 << (value / 10);
            if (q_ones !== expected_ones || q_tens !== expected_tens ||
                carry_ones !== (value % 10 == 9) ||
                carry_tens !== (value / 10 == 9)) begin
                $display("FAIL at %0t: expected %02d, q_tens=%b q_ones=%b",
                         $time, value, q_tens, q_ones);
                $fatal(1);
            end
        end
    endtask

    initial begin
        $timeformat(-9, 0, " ns", 1);
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);

        reset = 1'b0;
        #1 reset = 1'b1;
        #1 check_count(0);
        #23 reset = 1'b0;

        for (step = 1; step <= 110; step = step + 1) begin
            @(posedge clk);
            #1;
            expected = step % 100;
            check_count(expected);
            if (step == 9 || step == 10 || step == 99 || step == 100)
                $display("%0t: count=%02d", $time, expected);
        end

        #2 reset = 1'b1;
        #1 check_count(0);
        $display("PASS: 110 clocks, 09->10, 99->00 and asynchronous reset.");
        $finish;
    end
endmodule
