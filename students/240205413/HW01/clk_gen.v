module clk_gen(clk);
output reg clk = 0;
initial begin
    forever  #10 clk = ~clk;
end
endmodule