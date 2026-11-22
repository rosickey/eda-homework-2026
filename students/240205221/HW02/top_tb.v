`timescale 1s/100ms

module top_tb;
    wire clk;

    reg  P_green;
    reg  P_yellow;
    reg  P_red;

    wire Q_green;
    wire Q_yellow;
    wire Q_red;

    clk_gen_1s u_clk_gen_1s(clk);

    led u_led_green (P_green,  Q_green);
    led u_led_yellow(P_yellow, Q_yellow);
    led u_led_red   (P_red,    Q_red);

    initial begin
        P_green = 1'b1;
        forever
        begin
            #30 P_green = 1'b0;
            #40 P_green = 1'b1;
        end
    end

    initial begin
        P_yellow = 1'b0;
        #30;
        forever
        begin
            repeat (10)
            begin
                @(posedge clk) P_yellow = 1'b1;
                @(negedge clk) P_yellow = 1'b0;
            end
            #60;
        end
    end

    initial begin
        P_red = 1'b0;
        #40 P_red = 1'b1;
        forever
        begin
            #30 P_red = 1'b0;
            #40 P_red = 1'b1;
        end
    end

    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars;
        #72 $finish;
    end
endmodule
