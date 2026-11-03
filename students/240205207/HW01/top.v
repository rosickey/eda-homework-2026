module top_tb;

wire clk;
wire [9:0] q;
wire led0,led1,led2,led3,led4,led5,led6,led7;

clk_gen u_clk_gen(
    .clk(clk)
);

cd4017 u_cd4017(
    .clk(clk),
    .q(q)
);
led u_led0 (.in(q[0]), .out(led0));
led u_led1 (.in(q[1]), .out(led1));
led u_led2 (.in(q[2]), .out(led2));
led u_led3 (.in(q[3]), .out(led3));
led u_led4 (.in(q[4]), .out(led4));
led u_led5 (.in(q[5]), .out(led5));
led u_led6 (.in(q[6]), .out(led6));
led u_led7 (.in(q[7]), .out(led7));

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, top_tb);
    #400;
    $finish;
end

endmodule