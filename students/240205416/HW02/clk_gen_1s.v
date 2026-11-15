`timescale 1ms/1ms
module clk_gen_1s(output reg clk);
initial begin
    clk = 1'b1;
end
always #500 clk = ~clk;
endmodule
