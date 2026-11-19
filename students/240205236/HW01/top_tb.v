module test led;
    wire clk;
    reg [0:7] led_clk;
    wire [0:7] out;

    clk_gen u_clk(clk);

    led u_ledo(led_clk[o], out[o]);
    led u led1(led_clk[1], out[1]);
    led u_led2(led_clk[2], out[2]);
    led u_led3(led_clk[3], out[3]);
    led u_led4(led_clk[4], out[4]);
    led u led5(led clk[5], out[5]);
    led u_led6(led_clk[6], out[6]);
    led u_led7(led_clk[7], out[7]);

    always @(posedge clk)
    begin
         led clk <={led clk[6:0], led clk[7]);
    end

    initial
    begin
        led_clk <= 8'b0000_0001;
        $dumpfile("done");
        $dumpvars0;
        #200 $finish0;
   end
endmodule