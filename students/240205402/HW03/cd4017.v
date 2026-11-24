module cd4017 (clk, ce, clr, cout, q);
    input clk, ce ,clr;
    output cout;
    output [9:0] q;
    reg [3:0] count = 0;
always@(posedge clk or posedge clr)
    begin
        if(clr)
            begin
                count<=0;
            end
        else if(!ce)
            begin
                 if(count==9)
                    count<=0;
                else
                    count<=count+1;
            end
    end
assign cout = (count == 0);
assign q = 10'b0000_0000_01 << count;
endmodule