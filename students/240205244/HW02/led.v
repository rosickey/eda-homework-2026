`timescale 1s / 1ms
module led(ctrl, clk, q);
input ctrl;
input clk;
output reg q;
always @(*) begin
    if(ctrl == 1'b1) begin
        q = clk;
    end
    else begin
        q = 1'b0;
    end
end
endmodule