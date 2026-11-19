`timescale 1ms/1ms
module top_tb;
    wire clk;
    reg [1:0] state;
    reg [7:0] count;
    reg[2:0] led_clk;
    wire led_red, led_green, led_yellow;
    clk_gen_1s clk_gen(clk);
    led red_led    (led_clk[0], led_red);
    led green_led  (led_clk[1], led_green);
    led yellow_led (led_clk[2], led_yellow);

    always @(posedge clk)
    begin
        case (state)
            2'b00: begin
                led_clk[0] <= 0;
                led_clk[1] <= 1;
                led_clk[2] <= 0;
                if (count == 7'd29) 
                begin
                    state <= 2'b01;
                    count <= 0;
                end 
                else 
                begin
                    count <= count + 1;
                end
            end
            2'b10: begin
                led_clk[0] <= 1;
                led_clk[1] <= 0;
                led_clk[2] <= 0;
                if (count == 7'd29) 
                begin
                    state <= 2'b00;
                    count <= 0;
                end 
                else 
                begin
                    count <= count + 1;
                end
            end
        endcase
    end
always @(clk)
    begin
        case (state)
            2'b01: begin
                led_clk[0] <= 0;
                led_clk[1] <= 0;
                led_clk[2] <= clk;
                if (count == 5'd20) 
                begin
                    state <= 2'b10;
                    count <= 0;
                end 
                else 
                begin
                    count <= count + 1;
                end
            end
        endcase
    end
    initial 
    begin
        $dumpfile("top_tb.vcd");
        $dumpvars();
    end

    initial 
    begin
        state = 2'b00;
        count = 0;
        led_clk[0] = 0;
        led_clk[1] = 0;
        led_clk[2] = 0;

        #1000000 $finish;
    end
endmodule