`timescale 1ns/1ns

module top_tb;
    wire clk_1s;
    wire r, g, y;
    reg red, green, yellow;
    reg [6:0] cnt;
    reg [1:0] state;

    clk_gen_1s u_clk(clk_1s);
    led ur(red, r);
    led ug(green, g);
    led uy(yellow, y);

    always @(posedge clk_1s) begin
        if (state == 0) begin
            {red, green, yellow} = 3'b100;
            if (cnt == 29) begin state <= 1; cnt <= 0; end
            else cnt <= cnt + 1;
        end
        else if (state == 1) begin
            {red, green, yellow} = 3'b010;
            if (cnt == 29) begin state <= 2; cnt <= 0; end
            else cnt <= cnt + 1;
        end
        else if (state == 2) begin
            {red, green, yellow} = {2'b00, clk_1s};
            if (cnt == 9) begin state <= 0; cnt <= 0; end
            else cnt <= cnt + 1;
        end
    end

    initial begin
        state = 0; 
        cnt = 0;
        red = 0; 
        green = 0; 
        yellow = 0;
        $dumpfile("wave.vcd");
        $dumpvars;
        #80000; 
        $finish;
    end
endmodule