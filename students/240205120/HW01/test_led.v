module test_led;
wire clk;
reg [7:0] led_input;
wire [7:0] led_output;
clk_gen u_clk_gen (clk);
led u_led0 (led_input[0], led_output[0]);
led u_led1 (led_input[1], led_output[1]);
led u_led2 (led_input[2], led_output[2]);
led u_led3 (led_input[3], led_output[3]);
led u_led4 (led_input[4], led_output[4]);
led u_led5 (led_input[5], led_output[5]);
led u_led6 (led_input[6], led_output[6]);
led u_led7 (led_input[7], led_output[7]);
always @(posedge clk)
led_input <= {led_input[6:0], led_input[7]};
initial begin
led_input = 8'b00000001;
$dumpfile("done");
$dumpvars(0);
$monitor("Time: %0d ns clk = %b LED = %b", $time, clk, led_output);
#200;
$finish;
end
endmodule
