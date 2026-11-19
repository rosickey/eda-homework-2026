module cd4017(clk,reset,inhibit,carry_out,q);
      input clk,reset,inhibit;
      output carry_out;
      output[9:0] q;
      reg[3:0] count;
always@(posedge clk or posedge reset)
begin
             if(reset)
                                count<=0;
else if(!inhibit)
begin
if(count==9)
count<=0;
else
count<=count+1;
     end
end
assign q=10'b0000_0000_01<<count;
assign carry_out=!(count<9);
endmodule