module top_led;
wire clk;
wire [7:0] inp;
wire [7:0] outp;
wire cout = 0;
clk_gen uclk (clk);
led u_led1 (inp[0], outp[0]);
led u_led2 (inp[1], outp[1]);
led u_led3 (inp[2], outp[2]);
led u_led4 (inp[3], outp[3]);
led u_led5 (inp[4], outp[4]);
led u_led6 (inp[5], outp[5]);
led u_led7 (inp[6], outp[6]);
led u_led8 (inp[7], outp[7]);
    cd4017 u_cd4017 (clk, 1'b0, 1'b0, cout, inp);
initial 
begin
    $dumpfile("led.vcd");
    $dumpvars();

    #5000 $finish;
end
endmodule