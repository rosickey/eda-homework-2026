`timescale 1s/1ms
module top_tb;
    wire clk;
    wire red, yellow, green;
    wire out_red, out_yellow, out_green;
    reg [6:0] cnt;

    clk_gen_1s u_clk_gen_1s(clk);

    led u_led_red(red, out_red);
    led u_led_yellow(yellow, out_yellow);
    led u_led_green(green, out_green);

    always @(posedge clk) begin
        if (cnt == 7'd69)
            cnt <= 7'd0;
        else
            cnt <= cnt + 7'd1;
    end

    assign red = (cnt < 7'd30);
    assign green = (cnt >= 7'd30) && (cnt < 7'd60);
    assign yellow = (cnt >= 7'd60) && clk;

    initial begin
        cnt = 7'd0;
        $dumpfile("top_tb.vcd");
        $dumpvars();
        #140 $finish;
    end
endmodule
