module cd4017(clk,carry_out,q);
    input clk;
    output carry_out;
    output [7:0] q;
    reg [3:0] count = 4'd0;

    always @(posedge clk)
    begin
        if(count == 7)
            count <= 0;
        else
            count <= count + 1;
    end

    assign carry_out = (count == 7);
    assign q = 8'b0000_0001 << count;
endmodule
