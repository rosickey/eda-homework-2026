module cd4017 (clk, reset, inhibit, cout, q);
    input clk, reset ,inhibit;
    output cout;
    output [9:0] q;
    reg [3:0] count = 0;
always@(posedge clk or posedge reset)
    begin
        if(reset)
            begin
                count<=0;
            end
        else if(!inhibit)
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
	