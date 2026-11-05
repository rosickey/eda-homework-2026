module led(led_clk,out);
input led_clk;
output out;
reg out;
always@(*)
begin
    out<=led_clk;
end
endmodule