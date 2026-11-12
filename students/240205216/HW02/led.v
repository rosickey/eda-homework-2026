module led
(
    input wire light_enable,
    output reg led_out
);

always @(*) begin
    if(light_enable)
        led_out = 1'b1;
    else
        led_out = 1'b0;
end

endmodule
