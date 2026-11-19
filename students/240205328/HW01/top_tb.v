module test_led;
wire clk;
wire [7:0] out;
wire [9:0] q;
reg reset,inhibit;
wire carry_out;

clk_gen u_clk(clk);
cd4017 u_4017(clk,reset,inhibit,carry_out,q);

led u_led0(led_clk[0],out[0]);
led u_led1(led_clk[1],out[1]);
led u_led2(led_clk[2],out[2]);
led u_led3(led_clk[3],out[3]);
led u_led4(led_clk[4],out[4]);
led u_led5(led_clk[5],out[5]);
led u_led6(led_clk[6],out[6]);
led u_led7(led_clk[7],out[7]);

wire [7:0] led_clk;
assign led_clk = q[7:0];

initial begin
    $dumpfile("done");
    $dumpvars();
    reset = 1;
    inhibit = 0;
    #20 reset = 0;
    #200 $finish();
end

endmodule