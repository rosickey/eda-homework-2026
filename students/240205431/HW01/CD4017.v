module cd4017(reset,clk,inhibit,carry_out,q);
input clk,reset,inhibit;
output carry_out;
output[7:0] q;
reg [3:0] count = 0;
always@(posedge clk or posedge reset)
begin
    if(reset)
    begin
        count<=0;
    end
    else if(!inhibit)
    begin
        if(count==7)
        count<=0;
        else
        count<=count+1;
    end
end
assign carry_out = (count == 7);
assign q = 8'b0000_0001 << count;
endmodule