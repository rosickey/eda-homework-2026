`timescale 1ns / 1ps

module cd4017(
    input        CP0,
    input        MR,
    input        INH,
    output reg   Q0,
    output reg   Q1,
    output reg   Q2,
    output reg   Q3,
    output reg   Q4,
    output reg   Q5,
    output reg   Q6,
    output reg   Q7,
    output reg   Q8,
    output reg   Q9,
    output       CO
);

reg [3:0] cnt;
assign CO = (cnt >= 4'd5) ? 1'b0 : 1'b1;

always @(posedge CP0 or posedge MR) begin
    if(MR) begin
        cnt <= 4'd0;
    end
    else if(!INH) begin
        if(cnt == 4'd9)
            cnt <= 4'd0;
        else
            cnt <= cnt + 4'd1;
    end
end

always @(*) begin
    {Q9,Q8,Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0} = 10'b0;
    case(cnt)
        4'd0: Q0 = 1'b1;
        4'd1: Q1 = 1'b1;
        4'd2: Q2 = 1'b1;
        4'd3: Q3 = 1'b1;
        4'd4: Q4 = 1'b1;
        4'd5: Q5 = 1'b1;
        4'd6: Q6 = 1'b1;
        4'd7: Q7 = 1'b1;
        4'd8: Q8 = 1'b1;
        4'd9: Q9 = 1'b1;
    endcase
end

endmodule
