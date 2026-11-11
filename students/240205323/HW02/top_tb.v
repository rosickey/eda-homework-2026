`timescale 1ms/1ms
module top_tb;
    wire clk;
    reg [1:0] state;
    reg [6:0] count;
    reg ctrl_red, ctrl_green, ctrl_yellow;
    wire led_red, led_green, led_yellow;

    clk_gen_1s u_clk_gen (clk);
    led u_led_red    (ctrl_red, led_red);
    led u_led_green  (ctrl_green, led_green);
    led u_led_yellow (ctrl_yellow, led_yellow);

    always @(posedge clk) begin
        case (state)
            2'b00: begin
                ctrl_red <= 1;
                ctrl_green <= 0;
                ctrl_yellow <= 0;
                if (count == 7'd30) 
                begin
                    state <= 2'b01;
                    count <= 0;
                end 
                else 
                begin
                    count <= count + 1;
                end
            end
            2'b01: begin
                ctrl_red <= 0;
                ctrl_green <= 1;
                ctrl_yellow <= 0;
                if (count == 7'd30) 
                begin
                    state <= 2'b10;
                    count <= 0;
                end 
                else 
                begin
                    count <= count + 1;
                end
            end
            2'b10: begin
                ctrl_red <= 0;
                ctrl_green <= 0;
                ctrl_yellow <= !ctrl_yellow;
                if (count == 7'd10) 
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

    initial 
    begin
        $dumpfile("top_tb.vcd");
        $dumpvars();
    end

    initial 
    begin
        state = 2'b00;
        count = 0;
        ctrl_red = 0;
        ctrl_green = 0;
        ctrl_yellow = 0;

        #1000000000 $finish;
    end
endmodule