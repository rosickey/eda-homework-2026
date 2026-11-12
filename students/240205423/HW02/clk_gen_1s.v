`timescale 1s / 100ms

module clk_gen_1s(clk);
    output clk;
    reg    clk;

    initial begin
        clk = 1'b0;
    end

    always begin
        #0.5 clk = ~clk;
    end
endmodule
