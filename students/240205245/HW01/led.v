module led(clk,q);
input clk;
output reg q;

always@(*)
	begin
if (clk==1)
	begin
	q=1;
end
else  begin
q=0;
end

end
endmodule