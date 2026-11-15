module cd4017 (clk, ce, clr, cout, q);
    input clk, ce ,clr;
    output cout;
    output [7:0] q;
    reg [3:0] count = 0;
always@(posedge clk or posedge clr)
    begin
        if(clr)
            begin
                count<=0;
            end
        else if(!ce)
            begin
                if(count==7)
                    count<=0;
                else
                    count<=count+1;
            end
    end
assign cout = (count == 7);
assign q = 8'b0000_0001 << count;
endmodule