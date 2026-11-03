module led(clk,out);
input clk;
output[7:0] out;
reg[7:0] temp;
initial begin
    temp=8'b0000_0001;
end
always@(posedge clk)
begin
    temp<={out[6:0],out[7]}; 
end
assign out=clk?temp:8'b0; 
endmodule