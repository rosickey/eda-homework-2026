`timescale 1s/1ms
module top_tb;
    wire clk;
    reg reset;
    wire carry_units;
    wire carry_tens;
    wire inhibit_tens;
    wire [9:0] q_units;
    wire [9:0] q_tens;
    wire [3:0] units_val;
    wire [3:0] tens_val;
    reg [7:0] num;

    function [3:0] dval;
        input [9:0] q;
        integer i;
        begin
            dval = 4'd0;
            for (i = 0; i < 10; i = i + 1)
                if (q[i] == 1'b1)
                    dval = i;
        end
    endfunction

    assign inhibit_tens = !carry_units;
    assign units_val = dval(q_units);
    assign tens_val = dval(q_tens);

    clk_gen u_clk(clk);
    cd4017 u_units(clk, reset, 1'b0, carry_units, q_units);
    cd4017 u_tens(clk, reset, inhibit_tens, carry_tens, q_tens);

    always @(posedge clk) begin
        num = num + 1'b1;
        $strobe("count=%0d  digit=%0d%0d", num, tens_val, units_val);
    end

    initial begin
        num = 8'd0;
        $dumpfile("report.vcd");
        $dumpvars(0, top_tb);
        reset = 1;
        #3 reset = 0;
    end

    initial begin
        #110 $finish;
    end
endmodule
