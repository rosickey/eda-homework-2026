module top_tb;

wire clk_1s;
wire red_out,yellow_out,green_out;

reg red_en,yel_en,gre_en;
wire yel_clk;

assign yel_clk = yel_en ? clk_1s : 1'b0;

clk_gen_1s u_clk(clk_1s);


led u_red(red_en, red_out);
led u_yellow(yel_clk, yellow_out);
led u_green(gre_en, green_out);

reg [7:0] cnt;
always @(posedge clk_1s) begin
    cnt <= cnt + 1'b1;
    if(cnt >= 70) begin
        cnt <= 0;
    end
end

always @(*) begin
    red_en = 1'b0;
    yel_en = 1'b0;
    gre_en = 1'b0;
    if(cnt < 30) begin
        red_en = 1'b1;
    end
    else if(cnt < 40) begin
        yel_en = 1'b1;
    end
    else if(cnt < 70) begin
        gre_en = 1'b1;
    end
end

initial begin
    cnt = 0;
    $dumpfile("wave.vcd");
    $dumpvars(0,top_tb);
    #80000000000;
    $finish;
end

endmodule
