module clk_gen (
    clk
);

output clk;
reg clk;

initial begin
    clk = 1'b0;
end

always #10 clk = ~clk;

endmodule
