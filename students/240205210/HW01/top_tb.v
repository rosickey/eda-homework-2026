`timescale 1ns/1ns
module top_tb;
wire clk;
wire [7:0] led_out;
reg reset;
reg inhibit;
clk_gen u_clk_gen(
    .clk(clk)
);
led u_led(
    .clk(clk),
    .reset(reset),
    .inhibit(inhibit),
    .led_out(led_out)
);
initial begin
    $dumpfile("report.vcd");
    $dumpvars(0, top_tb);
    reset = 1'b1;
    inhibit = 1'b0;
    #20 reset = 1'b0;
    #400;
    $finish;
end
endmodule
