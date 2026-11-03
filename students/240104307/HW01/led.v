module led_cathode(input square_in, output reg led);
always @(*) 
begin
    led = square_in;
end
endmodule
