ents/240205227/HW02/clk_gen_1s.v‎
Original file line number	Diff line number	Diff line change
`timescale 1s / 1ns
module clk_gen_1s(clk);
    output reg clk;
    initial begin
        clk = 0;
        forever #0.5 clk = ~clk;
    end
endmodule
‎students/240205227/HW02/led.v‎
