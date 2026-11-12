module led (
    input clk_1s,
    input rst_n,
    input en,
    input blink_en,
    output reg led_out
);

always @(posedge clk_1s or negedge rst_n) begin
    if (!rst_n) begin
        led_out <= 1'b0;
    end
    else if (en == 1'b0) begin
        led_out <= 1'b0;
    end
    else if (blink_en == 1'b1) begin
        led_out <= ~led_out;
    end
    else begin
        led_out <= 1'b1;
    end
end

endmodule
