`timescale 1ns / 1ps

module top_tb;
    wire clk_wire;
    reg  reset_reg;

    wire red_in, green_in, yellow_in;
    
    wire led_red_out, led_green_out, led_yellow_out;

    clk_gen_1s u_clk_gen_1s(.clk(clk_wire));

    initial begin
        reset_reg = 1'b1;
        #25 reset_reg = 1'b0;
    end

    reg [6:0] count;
    always @(posedge clk_wire or posedge reset_reg) begin
        if (reset_reg) begin
            count <= 7'd0;
        end else begin
            if (count == 7'd69) 
                count <= 7'd0; 
            else 
                count <= count + 1'b1;
        end
    end
    assign red_in    = (count < 30) ? 1'b1 : 1'b0;
    assign green_in  = (count >= 30 && count < 60) ? 1'b1 : 1'b0;
       assign yellow_in = (count >= 60) ? clk_wire : 1'b0; 

       led u_led_red   (.clk(red_in),    .out(led_red_out));
    led u_led_green (.clk(green_in),  .out(led_green_out));
    led u_led_yellow(.clk(yellow_in), .out(led_yellow_out));

        initial begin
        $dumpfile("wave.vcd");
        $dumpvars();
               #75000000000 $finish; 
    end
endmodule