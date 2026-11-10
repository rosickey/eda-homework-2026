module  clk_gen(clk);
output  clk;
reg clk;
initial
begin
     clk<=0;
     forever #500000000 clk=~clk;
                    end
endmodule