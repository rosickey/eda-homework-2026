`timescale 1s/1ms
module top_tb;

    wire clk;
    reg  [6:0] cnt;
    wire green, yellow, red;
    wire led_g, led_y, led_r;

    clk_gen_1s u_clk(clk);

    always @(negedge clk) begin
        if (cnt == 7'd69)
            cnt <= 7'd0;
        else
            cnt <= cnt + 1'b1;
    end

    assign green  = (cnt <  7'd30);
    assign yellow = (cnt >= 7'd30) && (cnt < 7'd40) && ~clk;
    assign red    = (cnt >= 7'd40);

    led u_led_g(green,  led_g);
    led u_led_y(yellow, led_y);
    led u_led_r(red,    led_r);

    initial begin
        cnt = 7'd0;
        #145;
        $finish;
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top_tb);
    end

endmodule
