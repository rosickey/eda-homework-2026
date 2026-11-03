module top_tb;
wire clk;
wire carry_out;
wire [9:0] q;
wire led0, led1, led2, led3, led4, led5, led6, led7;
reg reset;
reg inhibit;

clk_gen u_clk_gen (
    .clk(clk)
);

cd4017 u_cd4017 (
    .clk(clk),
    .reset(reset),
    .inhibit(inhibit),
    .carry_out(carry_out),
    .q(q)
);

led u_led0 (.clk(q[0]), .L(led0));
led u_led1 (.clk(q[1]), .L(led1));
led u_led2 (.clk(q[2]), .L(led2));
led u_led3 (.clk(q[3]), .L(led3));
led u_led4 (.clk(q[4]), .L(led4));
led u_led5 (.clk(q[5]), .L(led5));
led u_led6 (.clk(q[6]), .L(led6));
led u_led7 (.clk(q[7]), .L(led7));

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, top_tb);
    inhibit = 1'b0;  
    reset   = 1'b1;  
    #20 reset = 1'b0;
    #500 $finish;
end

endmodule