module led(
    input clk,      // 1s闪烁时钟
    input en,       // 使能
    input blink_en, // 1：闪烁模式；0：常亮模式
    output reg out
);

always @(*) begin
    if(!en) begin
        out = 1'b0;
    end
    else begin
        if(blink_en)
            out = clk;
        else
            out = 1'b1;
    end
end

endmodule
