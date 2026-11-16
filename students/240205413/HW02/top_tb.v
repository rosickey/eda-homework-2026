`timescale 1ms / 1ms

module top_tb;
wire clk_1s;
reg green,yellow,red; 
wire led_g,led_y,led_r;
reg[5:0] count; 
reg[1:0] state; 
initial
begin
    count = 6'd0;
    state = 2'd0;
end
clk_gen_1s U_clk_gen_1s(clk_1s);
led u_led_red(clk, led_r);
led u_led_yellow(clk, led_y);
led u_led_green(clk, led_g);
always @(posedge clk_1s) 
begin
    case(state)
        2'd0:begin
                if(count == 6'd29)
                begin
                    count <= 6'd0;
                    state <= 2'd1;
                end
                else
                    count <= count + 6'd1;
            end
        2'd1:begin
                if(count == 6'd9)
                begin
                    count <= 6'd0;
                    state <= 2'd2;
                end
                else
                    count <= count + 6'd1;
            end
        2'd2:begin
                if(count == 6'd29)
                begin
                    count <= 6'd0;
                    state <= 2'd3;
                end
                else
                    count <= count + 6'd1;
            end
        2'd3:begin
                if(count == 6'd9)
                begin
                    count <= 6'd0;
                    state <= 2'd0;
                end
                else
                    count <= count + 6'd1;
            end
        default: begin
            count <= 6'd0;
            state <= 2'd0;
            end
    endcase
end
always @(*)
begin
    case(state)
        2'd0: begin
            red <= 1;
            green <= 0;
            yellow <= 0;
        end
        2'd1: begin
            red <= 0;
            green <= 0;
            yellow <= clk_1s;
        end
        2'd2: begin
            red <= 0;
            green <= 1;
            yellow <= 0;
        end
        2'd3: begin
            red <= 0;
            green <= 0;
            yellow <= clk_1s; 
        end
        default: begin
            red <= 1;
            green <= 0;
            yellow <= 0;
        end
    endcase
    
end
assign led_g = green;
assign led_r = red;
assign led_y = yellow;

initial begin
    $dumpfile("done.vcd");
    $dumpvars;
    #300000;
    $finish;
end
endmodule
