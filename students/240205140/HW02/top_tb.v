`timescale 1s / 1ms
module top_tb;
    wire clk_wire;
    reg reset_reg;
    
        reg [6:0] cnt;     
    reg [1:0] state;        
        wire red_in;
    wire green_in;
    wire yellow_in;
        clk_gen_1s u_clk_gen_1s(clk_wire);
    
        initial
    begin
        reset_reg = 1'b1;
        #2 reset_reg = 1'b0; 
    end
        always @(posedge clk_wire or posedge reset_reg) 
    begin
        if (reset_reg) begin
            cnt <= 0;
            state <= 0;
        end else begin
            if (cnt == 69) 
                cnt <= 0;
            else 
                cnt <= cnt + 1;
                
             if (cnt < 30)       state <= 0; 
            else if (cnt < 60)  state <= 1; 
            else                state <= 2;
        end
    end
    
       assign red_in    = (state == 0) ? 1'b1 : 1'b0;
    assign green_in  = (state == 1) ? 1'b1 : 1'b0;
       assign yellow_in = (state == 2) ? clk_wire : 1'b0; 
       wire led_out_red, led_out_green, led_out_yellow;
    
    led u_led_red(red_in, led_out_red);
    led u_led_green(green_in, led_out_green);
    led u_led_yellow(yellow_in, led_out_yellow);
    
        initial
    begin
        $dumpfile("wave.vcd");
        $dumpvars();
        #80 $finish; 
    end
endmodule