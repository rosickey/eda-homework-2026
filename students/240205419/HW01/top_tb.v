module top_tb;
wire clk;
wire cout;
wire [7:0] led_I;
wire [7:0] led_O;
clk_gen u_clk_gen (clk);
cd4017 u_cd4017 (clk, 1'b0, 1'b0, cout, led_I);
led u_led1 (led_I[0], led_O[0]);
led u_led2 (led_I[1], led_O[1]);
led u_led3 (led_I[2], led_O[2]);
led u_led4 (led_I[3], led_O[3]);
led u_led5 (led_I[4], led_O[4]);
led u_led6 (led_I[5], led_O[5]);
led u_led7 (led_I[6], led_O[6]);
led u_led8 (led_I[7], led_O[7]);
initial 
begin
    $dumpfile("led.vcd");
    $dumpvars();
    
    #2000 $finish;
end
endmodule