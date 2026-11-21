`timescale 1ns / 1ns

module top_tb;

wire        clk_1s;
reg         rst;
reg         inhibit;

wire [9:0]  q_unit;
wire        co_unit;

wire [9:0]  q_ten;
wire        co_ten;

clk_gen_1s u_clk_gen_1s(
    clk_1s
);

cd4017 u_cd4017_unit(
    clk_1s,
    rst,
    inhibit,
    co_unit,
    q_unit
);

cd4017 u_cd4017_ten(
    co_unit,
    rst,
    inhibit,
    co_ten,
    q_ten
);

initial
begin
    rst = 1'b1;
    inhibit = 1'b0;
    #100;
    rst = 1'b0;
    #98000;
    $finish;
end

initial
begin
    $dumpfile("wave.vcd");
    $dumpvars(0, top_tb);
end

endmodule
