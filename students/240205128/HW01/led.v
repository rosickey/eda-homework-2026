module led(clk,out);
    input clk;
    output out;
    assign out = clk;   // out 直接跟随 clk 电平：clk 高则亮，clk 低则灭
endmodule
