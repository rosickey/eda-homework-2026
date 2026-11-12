`timescale 1ns/1ps
module top_tb;
    wire        clk_1s;
    reg  [1:0]  mode;
    reg  [5:0]  count;
    reg         red_en;
    reg         green_en;
    reg         yellow_en;
    wire        yellow_clk;
    wire        red_led;
    wire        green_led;
    wire        yellow_led;

    clk_gen_1s u_clk_gen_1s(clk_1s);

    led u_red    (red_en,    red_led);
    led u_green  (green_en,  green_led);
    led u_yellow (yellow_clk,yellow_led);

    assign yellow_clk = yellow_en & clk_1s;

    initial begin
        mode      = 2'd0;
        count     = 6'd0;
        red_en    = 1'b1;
        green_en  = 1'b0;
        yellow_en = 1'b0;
    end

    always @(posedge clk_1s) begin
        case (mode)
            2'd0: begin
                if (count == 6'd29) begin
                    red_en   <= 1'b0;
                    green_en <= 1'b1;
                    mode     <= 2'd1;
                    count    <= 6'd0;
                end else begin
                    count <= count + 1'b1;
                end
            end
            2'd1: begin
                if (count == 6'd29) begin
                    green_en  <= 1'b0;
                    yellow_en <= 1'b1;
                    mode      <= 2'd2;
                    count     <= 6'd0;
                end else begin
                    count <= count + 1'b1;
                end
            end
            2'd2: begin
                if (count == 6'd9) begin
                    yellow_en <= 1'b0;
                    red_en    <= 1'b1;
                    mode      <= 2'd0;
                    count     <= 6'd0;
                end else begin
                    count <= count + 1'b1;
                end
            end
            default: begin
                mode      <= 2'd0;
                count     <= 6'd0;
                red_en    <= 1'b1;
                green_en  <= 1'b0;
                yellow_en <= 1'b0;
            end
        endcase
    end

    initial begin
        $dumpfile("traffic_light.vcd");
        $dumpvars(0, top_tb);
        #150_000_000_000;
        $finish;
    end
endmodule