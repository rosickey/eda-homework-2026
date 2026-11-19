module top_tb;
wire clk;
wire [9:0] q;
wire q0,q1,q2,q3,q4,q5,q6,q7;
wire led0,led1,led2,led3,led4,led5,led6,led7;

clk_gen u_clk_gen(clk);
cd4017 u_cd4017(clk, q);

assign q0 = q[0];
assign q1 = q[1];
assign q2 = q[2];
assign q3 = q[3];
assign q4 = q[4];
assign q5 = q[5];
assign q6 = q[6];
assign q7 = q[7];

led u_led0(q0, led0);
led u_led1(q1, led1);
led u_led2(q2, led2);
led u_led3(q3, led3);
led u_led4(q4, led4);
led u_led5(q5, led5);
led u_led6(q6, led6);
led u_led7(q7, led7);

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, top_tb);
    #400;
    $finish;
end
endmodule
