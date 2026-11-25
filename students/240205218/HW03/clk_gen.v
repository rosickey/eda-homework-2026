module clk_gen(
    output reg clk
);
initial begin
    clk = 0;
end
always #10 clk = ~clk;
endmodule
