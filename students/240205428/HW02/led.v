module led(
    input clk,      
    input en,      
    input blink_en
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
