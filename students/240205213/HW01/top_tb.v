`timescale 1ns / 1ps

module top_tb;

wire clk;
wire q0,q1,q2,q3,q4,q5,q6,q7,q8,q9;
wire l0,l1,l2,l3,l4,l5,l6,l7;

reg MR;
reg INH;

clk_gen u_clk(
    .clk(clk)
);

cd4017 u_4017(
    .CP0(clk),
    .MR(MR),
    .INH(INH),
    .Q0(q0),
    .Q1(q1),
    .Q2(q2),
    .Q3(q3),
    .Q4(q4),
    .Q5(q5),
    .Q6(q6),
    .Q7(q7),
    .Q8(q8),
    .Q9(q9)
);

led u_led0 (.sig(q0), .light(l0));
led u_led1 (.sig(q1), .light(l1));
led u_led2 (.sig(q2), .light(l2));
led u_led3 (.sig(q3), .light(l3));
led u_led4 (.sig(q4), .light(l4));
led u_led5 (.sig(q5), .light(l5));
led u_led6 (.sig(q6), .light(l6));
led u_led7 (.sig(q7), .light(l7));

initial begin
    $dumpfile("wave.vcd");
    $dumpvars;
    MR  = 1'b1;
    INH = 1'b0;
    #20;
    MR = 1'b0;
    #300;
    $finish;
end

endmodule
