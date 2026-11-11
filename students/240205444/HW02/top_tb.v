`timescale 1s/1ms
module top_tb;

    wire clk;
    wire red, yellow, green;
    reg [6:0] sec;
    wire red_drv, yellow_drv, green_drv;

    clk_gen_1s u_clk(clk);
    led u_led_red    (red_drv,    red);
    led u_led_yellow (yellow_drv, yellow);
    led u_led_green  (green_drv,  green);

    always @(negedge clk) begin
        if (sec == 7'd69)
            sec <= 7'd0;
        else
            sec <= sec + 1'b1;
    end

    assign green_drv  = (sec <  7'd30);
    assign yellow_drv = (sec >= 7'd30) && (sec < 7'd40) && ~clk;
    assign red_drv    = (sec >= 7'd40);

    initial begin
        sec = 7'd0;
        #145;
        $finish;
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top_tb);
    end

    initial
        $monitor("t = %0.1f s , R=%b , Y=%b , G=%b", $realtime, red, yellow, green);

endmodule
