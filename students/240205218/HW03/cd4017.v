module cd4017(
    input clk,
    input rst_n,
    input inhibit,
    output reg [9:0] q,
    output carry
);
assign carry = (q[9]) ? 1'b0 : 1'b1;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        q <= 10'b0000000001;
    end
    else if(inhibit == 1'b0) begin
        q <= {q[8:0], q[9]};
    end
end
endmodule
