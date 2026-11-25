`timescale 1ns / 1ns

module cd4017 (
    input  wire       clk,
    input  wire       reset,
    input  wire       inhibit,
    output wire       carry_out,
    output wire [9:0] q
);

    reg [3:0] count;

    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 4'd0;
        else if (!inhibit) begin
            if (count == 4'd9)
                count <= 4'd0;
            else
                count <= count + 1'b1;
        end
    end

    assign q         = 10'b00_0000_0001 << count;
    assign carry_out = (count < 4'd5);

endmodule
