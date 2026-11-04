
module cd4017 (
    input        clk,
    input        rst,
    input        en,
    output reg [7:0] q
);
always @(posedge clk or posedge rst) begin
    if (rst) begin
        q <= 8'b00000001;
    end else if (en) begin
        q <= {q[6:0], q[7]};
    end
end
endmodule
