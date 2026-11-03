module test_led;
wire clk;
wire [7:0] out;
clk_gen u_clk(clk);
led u_led(clk,out);

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, test_led);
    #200 $finish;
end
endmodule