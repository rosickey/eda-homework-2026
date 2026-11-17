`timescale 1s/100ms

module clk_gen_1s(clk);
    output clk;
    reg clk;

    initial begin
        clk = 0;
    end

    always #0.5 clk = ~clk;
endmodule