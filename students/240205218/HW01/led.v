module led(
    input [9:0] q,
    output reg [9:0] led_out
);
always @(*) begin
    led_out = q;
end
endmodule
