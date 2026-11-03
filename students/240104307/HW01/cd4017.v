module cd4017(
    input clk,
    input rst,
    input inh,
    output reg [9:0] q
);
always @(posedge clk or posedge rst) begin
    if(rst) begin
        q <= 10'b0000000001;
    end
    else if(!inh) begin
        q <= {q[8:0], q[9]};
    end
end
endmodule
