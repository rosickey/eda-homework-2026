`timescale 1ms / 1us
module top_tb;
    reg clk;
    reg [1:0] state;
    reg [6:0] cnt;
    reg ctrl_red, ctrl_green;
    wire led_red, led_green, led_yellow, ctrl_yellow;

    clk_gen_1s u_clk_gen (clk);
    led u_led_red    (ctrl_red, led_red);
    led u_led_green  (ctrl_green, led_green);
    led u_led_yellow (ctrl_yellow, led_yellow);

    always @(posedge clk) begin
        case (state)
            2'd0: begin
                ctrl_red <= 1'b1; ctrl_green <= 1'b0;
                if (cnt == 7'd29) begin state <= 2'd1; cnt <= 7'd0; end
                else cnt <= cnt + 1'b1;
            end
            2'd1: begin
                ctrl_red <= 1'b0; ctrl_green <= 1'b1;
                if (cnt == 7'd29) begin state <= 2'd2; cnt <= 7'd0; end
                else cnt <= cnt + 1'b1;
            end
            2'd2: begin
                ctrl_red <= 1'b0; ctrl_green <= 1'b0;
                if (cnt == 7'd9) begin state <= 2'd0; cnt <= 7'd0; end
                else cnt <= cnt + 1'b1;
            end
        endcase
    end

    assign ctrl_yellow = (state == 2'd2) ? clk : 1'b0;

    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
        state = 2'd0;
        cnt = 7'd0;
        #140000 $finish;
    end
endmodule