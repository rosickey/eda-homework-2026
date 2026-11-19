module top_tb;
wire clk;
wire rst_n;
wire [9:0] q0;  //个位
wire [9:0] q1;  //十位
wire carry0;

reg rst_reg;
assign rst_n = rst_reg;

clk_gen u_clk(
    .clk(clk)
);

//个位CD4017
cd4017 u_low(
    .clk(clk),
    .rst_n(rst_n),
    .inhibit(1'b0),
    .q(q0),
    .carry(carry0)
);

//十位CD4017，时钟来自个位进位carry0
cd4017 u_high(
    .clk(carry0),
    .rst_n(rst_n),
    .inhibit(1'b0),
    .q(q1),
    .carry()
);

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,top_tb);
    rst_reg = 1'b0;
    #20
    rst_reg = 1'b1;
    #2000;
    $finish;
end
endmodule
