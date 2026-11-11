module led(
    input en,
    input clk_1s,
    output reg led_out
);

always @(*) begin
    if(!en) begin
        led_out = 1'b0;
    end
    else begin
        led_out = clk_1s;
    end
end

endmodule