module clk_gen_1s (
    input clk,
    input rst_n,
    output reg clk_1s
);

parameter CNT_MAX = 10'd499;
reg [9:0] cnt;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cnt <= 10'd0;
        clk_1s <= 1'b0;
    end
    else if (cnt == CNT_MAX) begin
        cnt <= 10'd0;
        clk_1s <= ~clk_1s;
    end
    else begin
        cnt <= cnt + 10'd1;
    end
end

endmodule
