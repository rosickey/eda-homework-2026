module CD4017(clk,reset,q,out,inhibit);
output [7:0] q;
reg [3:0] count;
output out;
input clk,reset,inhibit;
always@(posedge clk or posedge reset)
begin
                	if(reset)
				count<=0;
                        else if(!inhibit)
				begin
					if(count==8)
						count<=0;
					else
					        count<=count+1;
				end		
end
assign out=(count==8);
assign q=10'b00_0000_0001<<count;
endmodule
‎