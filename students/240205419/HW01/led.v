module led(clk, led);
    input wire clk;
    output reg led;
    always @(*)
        begin
            led <= clk;
        end
endmodule