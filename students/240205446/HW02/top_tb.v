`timescale 1s/100ms

module top_tb;
    wire clk;
    reg  P_red;
    reg  P_green;
    reg  P_yellow;
    wire Q_red;
    wire Q_green;
    wire Q_yellow;

    clk_gen_1s u_clk_gen_1s(clk);

    led u_led_red   (P_red,    Q_red);
    led u_led_green (P_green,  Q_green);
    led u_led_yellow(P_yellow, Q_yellow);

    initial begin
        P_red    = 1'b1;
        P_green  = 1'b0;
        P_yellow = 1'b0;
        $dumpfile("top_tb.vcd");
        $dumpvars();
        #220 $finish;
    end

    initial begin
        forever begin
            #30 P_red = 1'b0;
            #40 P_red = 1'b1;
        end
    end

    initial begin
        #30;
        forever begin
            P_green = 1'b1;
            #30 P_green = 1'b0;
            #40;
        end
    end

    initial begin
        #60;
        forever begin
            repeat (10) begin
                P_yellow = 1'b1;
                #0.5;
                P_yellow = 1'b0;
                #0.5;
            end
            #60;
        end
    end
endmodule