module cd4017 (
    input clk,
    input reset,
    input inhibit,
    output carry_out,
    output [9:0] q
);
    reg [3:0] count;

    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 4'd0;
        else if (!inhibit) begin
            if (count == 4'd9)
                count <= 4'd0;
            else if (count < 4'd9)
                count <= count + 1'b1;
            else
                count <= 4'd0;
        end
    end

    assign q = 10'b0000000001 << count;
    assign carry_out = (count < 4'd5);
endmodule
