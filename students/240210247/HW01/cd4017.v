module cd4017(clk, rst, q);
    input clk;
    input rst;
    output [9:0] q;
    reg [9:0] q;

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 10'b0000000001;
        else
            q <= {q[8:0], q[9]};
    end
endmodule
