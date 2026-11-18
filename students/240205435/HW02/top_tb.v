`timescale 1ms/1ms
module top_tb;
        wire clk;
        wire led_red,led_yellow,led_green;
        reg ctrl_red,ctrl_yellow,ctrl_green;

        clk_gen_1s u_clk_gen(clk);

        led u_red(ctrl_red,led_red);
        led u_green(ctrl_green,led_green);
        led u_yellow(ctrl_yellow,led_yellow);

        reg [1:0] state;
        reg [6:0] count;

    initial 
        begin
            $dumpfile("done.vcd");
            $dumpvars();

            state = 2'b00;
            count = 0;
            
            ctrl_red = 0;
            ctrl_green = 0;
            ctrl_green = 0;

             #10000000 $finish;
        end

    always @(clk) 
    begin
        case (state)
            2'b00: begin
                ctrl_red <= 1;
                ctrl_green<= 0;
                ctrl_yellow <= 0;
                if (count == 7'd59) 
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
                if (count == 7'd59) 
                begin
                    state <= 2'b10;
                    count <= 0;
                    ctrl_yellow = 0;
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
                if (count == 7'd19) 
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
endmodule
