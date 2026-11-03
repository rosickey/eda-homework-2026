module test_led;
wire clk;
wire l1,l2,l3,l4,l5,l6,l7,l8;
wire out;
wire [9:0] q;
reg rst;
clk_gen u_clk(clk);
cd4017 u_4017(clk, rst, 1'b0, out, q);
initial begin
    rst = 1'b1;
    #20 rst = 1'b0;
end
always @(posedge clk) begin
    if(rst) begin
        rst <= 1'b0;
    end
    else if(q[7]) begin
        rst <= 1'b1;
    end
    else begin
        rst <= 1'b0;
    end
end
assign l1 = (q == 10'b000000001) ? clk : 1'b0;
assign l2 = (q == 10'b000000010) ? clk : 1'b0;
assign l3 = (q == 10'b000000100) ? clk : 1'b0;
assign l4 = (q == 10'b000001000) ? clk : 1'b0;
assign l5 = (q == 10'b000010000) ? clk : 1'b0;
assign l6 = (q == 10'b000100000) ? clk : 1'b0;
assign l7 = (q == 10'b001000000) ? clk : 1'b0;
assign l8 = (q == 10'b010000000) ? clk : 1'b0;
initial begin
    $dumpfile("l.vcd");
    $dumpvars();
    #800 $finish();
end
endmodule
