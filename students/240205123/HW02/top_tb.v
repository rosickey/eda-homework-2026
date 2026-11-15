`timescale 1ms/1ms

module top_tb;
    localparam [1:0] RED = 2'd0;
    localparam [1:0] GREEN = 2'd1;
    localparam [1:0] YELLOW = 2'd2;
    localparam [5:0] RED_GREEN_SECONDS = 6'd30;
    localparam [3:0] YELLOW_SECONDS = 4'd10;

    wire clk_1s;
    wire red_led;
    wire yellow_led;
    wire green_led;
    wire red_input;
    wire yellow_input;
    wire green_input;
    reg [1:0] state;
    reg [5:0] elapsed_seconds;

    clk_gen_1s u_clk_gen_1s (clk_1s);

    assign red_input = (state == RED);
    assign yellow_input = (state == YELLOW) ? clk_1s : 1'b0;
    assign green_input = (state == GREEN);

    led u_red_led (red_input, red_led);
    led u_yellow_led (yellow_input, yellow_led);
    led u_green_led (green_input, green_led);

    initial begin
        state = RED;
        elapsed_seconds = 6'd0;

        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);

        #140000 $finish;
    end

    always @(posedge clk_1s) begin
        case (state)
            RED: begin
                if (elapsed_seconds == RED_GREEN_SECONDS - 1'b1) begin
                    state <= GREEN;
                    elapsed_seconds <= 6'd0;
                end else begin
                    elapsed_seconds <= elapsed_seconds + 1'b1;
                end
            end
            GREEN: begin
                if (elapsed_seconds == RED_GREEN_SECONDS - 1'b1) begin
                    state <= YELLOW;
                    elapsed_seconds <= 6'd0;
                end else begin
                    elapsed_seconds <= elapsed_seconds + 1'b1;
                end
            end
            YELLOW: begin
                if (elapsed_seconds == YELLOW_SECONDS - 1'b1) begin
                    state <= RED;
                    elapsed_seconds <= 6'd0;
                end else begin
                    elapsed_seconds <= elapsed_seconds + 1'b1;
                end
            end
            default: begin
                state <= RED;
                elapsed_seconds <= 6'd0;
            end
        endcase
    end
endmodule