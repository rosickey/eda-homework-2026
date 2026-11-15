`timescale 1ns / 1ps

module top_tb;
    wire clk_1s;     
    wire led_r_out;  
    wire led_y_out;  
    wire led_g_out;  
    
    reg [1:0] state;
    reg [4:0] cnt;       
    reg r_in, y_in, g_in; 

    parameter RED    = 2'd0;
    parameter GREEN  = 2'd1;
    parameter YELLOW = 2'd2;

    clk_gen_1s u_clk_gen_1s (clk_1s);

    led u_led_r (r_in, led_r_out);
    led u_led_y (y_in, led_y_out);
    led u_led_g (g_in, led_g_out);

    always @(posedge clk_1s) begin
        case(state)
            RED: begin
                if (cnt == 5'd29) begin 
                    state <= GREEN;     
                    cnt   <= 5'd0;      
                end else begin
                    cnt   <= cnt + 1'b1;
                end
            end
            GREEN: begin
                if (cnt == 5'd29) begin 
                    state <= YELLOW;    
                    cnt   <= 5'd0;
                end else begin
                    cnt   <= cnt + 1'b1;
                end
            end
            YELLOW: begin
                if (cnt == 5'd9) begin  
                    state <= RED;       
                    cnt   <= 5'd0;
                end else begin
                    cnt   <= cnt + 1'b1;
                end
            end
            default: begin
                state <= RED;
                cnt   <= 5'd0;
            end
        endcase
    end

    always @(*) begin
        r_in = 1'b0; 
        y_in = 1'b0; 
        g_in = 1'b0;

        case(state)
            RED: begin
                r_in = 1'b1; 
            end
            GREEN: begin
                g_in = 1'b1;
            end
            YELLOW: begin
                y_in = clk_1s; 
            end
        endcase
    end

    initial begin
        state = RED;
        cnt = 5'd0;
        
        $dumpfile("demo4.vcd");
        $dumpvars(0, top_tb);
        
        #80_000_000_000; 
        $finish;
    end

endmodule