`timescale 1ms / 1ms

module clk_gen_1s(clk_1s);
output reg clk_1s = 0;
initial begin
    forever  #500 clk_1s = ~clk_1s;
end
endmodule

