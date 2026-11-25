module top_tb;
wire clk;
reg rst;

wire [3:0] q_low;
wire [3:0] q_high;
wire carry_low;
reg carry_low_r;

clk_gen u_clk (
    .clk(clk)
);

cd4017 u_low (
    .clk(clk),
    .rst(rst),
    .q(q_low),
    .carry(carry_low)
);

always @(posedge clk) begin
    carry_low_r <= carry_low;
end
wire carry_low_neg = carry_low_r & (~carry_low);

cd4017 u_high (
    .clk(carry_low_neg),
    .rst(rst),
    .q(q_high),
    .carry()
);

initial begin
    rst = 1'b1;
    #15 rst = 1'b0;
    #1200 $finish;
end

initial begin
    $dumpfile("wave.vcd");
    $dumpvars;
end
endmodule
