module led(clk,led);
input clk;
output reg led;
always@(*)
begin
	assign led=clk;
end
endmodule