`timescale 1ns / 1ps

module top_tb;
    wire clk;
    wire red;
    wire yellow;
    wire green;
    wire red_led;
    wire yellow_led;
    wire green_led;
    reg [6:0] count;

    initial begin
        count = 7'd0;

        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);

        #70000000000;
        $finish;
    end

    always @(posedge clk) begin
        if (count == 7'd69)
            count <= 7'd0;
        else
            count <= count + 1'b1;
    end

    assign red = (count < 7'd30);
    assign green = (count >= 7'd30 && count < 7'd60);
    assign yellow = (count >= 7'd60) ? clk : 1'b0;

    clk_gen_1s u_clk_gen_1s(clk);

    led u_red(red, red_led);
    led u_yellow(yellow, yellow_led);
    led u_green(green, green_led);
endmodule
