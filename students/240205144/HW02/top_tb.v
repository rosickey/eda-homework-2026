`timescale 1ms/1ms
module top_tb;
    wire clk;
    reg red;
    reg green;
    wire yellow;
    wire q_r, q_y, q_g;
    reg [1:0] counta;
    reg [5:0] count;
    integer t_sec;
    clk_gen_1s u_clk_gen_1s(clk);
    led u_green (green, q_g);
    led u_yellow(yellow, q_y);
    led u_red   (red,   q_r);
    assign yellow = (counta == 2) ? ~clk : 1'b0;
    initial
    begin
        counta = 1;
        count  = 0;
        red    = 0;
        green  = 1;
        t_sec  = 0;
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
        $display("  t(s)   R Y G");
        $monitor("  %3d    %b %b %b", t_sec, q_r, q_y, q_g);
        #140000 $finish;
    end
    always @(posedge clk)
        t_sec <= t_sec + 1;
    always @(posedge clk)
    begin
        case (counta)
            1: begin
                if (count == 29) begin
                    count   <= 0;
                    counta  <= 2;
                    green   <= 0;
                    red     <= 0;
                end
                else begin
                    count <= count + 1;
                    green <= 1;
                    red   <= 0;
                end
            end
            2: begin
                if (count == 9) begin
                    count   <= 0;
                    counta  <= 3;
                    red     <= 1;
                    green   <= 0;
                end
                else begin
                    count <= count + 1;
                    red   <= 0;
                    green <= 0;
                end
            end
            3: begin
                if (count == 29) begin
                    count   <= 0;
                    counta  <= 1;
                    red     <= 0;
                    green   <= 1;
                end
                else begin
                    count <= count + 1;
                    red   <= 1;
                    green <= 0;
                end
            end
            default: begin
                count   <= 0;
                counta  <= 1;
                red     <= 0;
                green   <= 1;
            end
        endcase
    end
endmodule
