`timescale 1ns / 1ps

module clk_gen(
    output reg clk
);
parameter PERIOD = 10;

initial begin
    clk = 1'b0;
    forever #(PERIOD/2) clk = ~clk;
end

endmodule
