module clk_gen_1s
(
    input  wire system_clock,
    input  wire system_reset,
    output reg  one_second_pulse
);
localparam COUNT_MAX = 25'd49_999_999;
reg [24:0] count_reg;

always @(posedge system_clock or negedge system_reset) begin
    if(!system_reset) begin
        count_reg <= 25'd0;
        one_second_pulse <= 1'b0;
    end
    else begin
        if(count_reg == COUNT_MAX) begin
            count_reg <= 25'd0;
            one_second_pulse <= ~one_second_pulse;
        end
        else begin
            count_reg <= count_reg + 25'd1;
        end
    end
end
endmodule
