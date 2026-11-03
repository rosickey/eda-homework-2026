module clk_gen (clk);
    output reg clk = 0;
    always #5 clk = ~clk;
endmodule