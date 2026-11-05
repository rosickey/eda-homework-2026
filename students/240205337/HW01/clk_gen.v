module clk_gen(clk);
reg clk;
output clk;
initial
begin
clk=0;
forever #10 clk=~clk;
end
endmodule