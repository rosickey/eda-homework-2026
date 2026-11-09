module cd4017(
    input clk,
    output reg [9:0] q
);

initial begin
    q = 10'b0000000001;  
end

always @(posedge clk) begin
    q <= {q[8:0], q[9]};
end

endmodule
