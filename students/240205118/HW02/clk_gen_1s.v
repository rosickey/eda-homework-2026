`timescale 1ms / 1us  
module clk_gen_1s(clk);  
    output clk;
    reg clk;
    initial
    begin
        clk = 0;
        forever #500 clk = ~clk; 
    end
endmodule