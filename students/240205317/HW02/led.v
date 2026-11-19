module led(clk,out);
input clk;
output out;
reg count;
always@(posedge clk or negedge clk)
begin
if(clk)
count<=1;
else
count<=0;
end
assign out=count;
endmodule

