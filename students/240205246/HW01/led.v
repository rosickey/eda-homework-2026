module led(input din,output reg led_out);
    always@(*)begin
        led_out = din;
    end
endmodule