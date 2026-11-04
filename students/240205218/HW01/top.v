module top(
    output [9:0] led
);
wire clk;
wire [9:0] q;
clk_gen clk_inst(.clk(clk));
cd4017 counter(.clk(clk), .q(q));
led led_inst(.q(q), .led_out(led));
endmodule
