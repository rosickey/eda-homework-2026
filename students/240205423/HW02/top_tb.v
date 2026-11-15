`timescale 1s / 100ms

module top_tb;

    wire clk;
    wire red;
    wire green;
    wire yellow;

    reg [3:0] lamp;
    reg [7:0] agreen, ayellow, ared;
    reg [7:0] numa;
    reg [2:0] counta;
    reg       tempa;

    wire yellow_en;
    assign yellow_en = lamp[2] & clk;

    clk_gen_1s u_clk_gen_1s(clk);

    led u_red(lamp[0], red);
    led u_green(lamp[3], green);
    led u_yellow(yellow_en, yellow);

    initial begin
        agreen  = 8'h30;
        ayellow = 8'h10;
        ared    = 8'h30;
        counta  = 3'd0;
        tempa   = 1'b0;
        numa    = 8'h30;
        lamp    = 4'b0000;
    end

    always @(posedge clk) begin
        if (!tempa) begin
            tempa <= 1'b1;
            case (counta)
                3'd0: begin
                    numa   <= agreen;
                    lamp   <= 4'b1000;
                    counta <= 3'd1;
                end
                3'd1: begin
                    numa   <= ayellow;
                    lamp   <= 4'b0100;
                    counta <= 3'd2;
                end
                3'd2: begin
                    numa   <= ared;
                    lamp   <= 4'b0001;
                    counta <= 3'd0;
                end
                default: lamp <= 4'b0001;
            endcase
        end
        else begin
            if (numa > 8'h2) begin
                if (numa[3:0] == 4'h0) begin
                    numa[3:0] <= 4'h9;
                    numa[7:4] <= numa[7:4] - 4'h1;
                end
                else begin
                    numa[3:0] <= numa[3:0] - 4'h1;
                end
            end
            else begin
                if (numa == 8'h2) begin
                    tempa <= 1'b0;
                end
            end
        end
    end

    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
    end

    initial begin
        #210;
        $finish;
    end

endmodule
