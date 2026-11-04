module test_led3;
wire clk;
wire [7:0] out;
wire [7:0] q;
reg rst;

clk_gen u_clk(clk);

cd4017 u_4017(
    .clk(clk),
    .rst(rst),
    .en(1'b0),
    .q(q)
);

led u_led0(q[0], out[0]);
led u_led1(q[1], out[1]);
led u_led2(q[2], out[2]);
led u_led3(q[3], out[3]);
led u_led4(q[4], out[4]);
led u_led5(q[5], out[5]);
led u_led6(q[6], out[6]);
led u_led7(q[7], out[7]);

initial begin
    $dumpfile("done.vcd");
    $dumpvars;
    rst = 1'b1;
    #20 rst = 1'b0;
    #600 $finish;
end

endmodule
