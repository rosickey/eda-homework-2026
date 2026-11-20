module top_tb;

wire clk;
wire [9:0] q0;
wire [9:0] q1;
wire carry0;
reg reset;

clk_gen u_clk_gen(
    clk
);

cd4017 u_low(
    clk,
    reset,
    1'b0,
    carry0,
    q0
);

cd4017 u_high(
    carry0,
    reset,
    1'b0,
    ,
    q1
);

initial begin
    reset = 1'b1;
    #20;
    reset = 1'b0;
    #2000;
    $finish;
end

initial begin
    $dumpfile("done");
    $dumpvars();
end

endmodule
