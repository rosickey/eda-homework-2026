
module clk_gen_1s(clk);
output clk;
reg clk;
initial
begin
    clk = 0;
    forever #500000000 clk = ~clk;  // 延时500ms，翻转，周期1s
end
endmodule
