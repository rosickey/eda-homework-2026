module cd4017 (
    input clk,
    input rst,
    output reg [3:0] q,
    output carry
);
assign carry = (q == 4'd9);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        q <= 4'd0;
    end else begin
        if (q == 4'd9)
            q <= 4'd0;
        else
            q <= q + 1'b1;
    end
end
endmodule
