module clk_gen_1s(clk);
output reg clk;
reg [25:0] cnt;

initial begin
    clk = 0;
    cnt = 0;
end

always #0.5 begin
    cnt = cnt + 1;
    if(cnt == 26'd500) begin
        clk = ~clk;
        cnt = 0;
    end
end

endmodule
