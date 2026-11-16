module led (clk, led);
    input wire clk;
    output reg led;

    always @(*)
        led <= clk;
endmodule
