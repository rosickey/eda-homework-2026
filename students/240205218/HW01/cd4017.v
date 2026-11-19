module cd4017(
    input clk,
    input rst_n,
    output reg [9:0] q
);
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        q <= 10'b0000000001;
    end
    else begin
        q <= {q[8:0], q[9]};
    end
end
endmodule
