`timescale 1s / 1ns
module top_tb;
    wire clk_1s;
    reg [6:0] cnt = 7'd0;  
    reg red_en, green_en, yellow_en;
    wire red, green, yellow;

    clk_gen_1s u_clk (clk_1s);

    always @(posedge clk_1s) begin
        if(cnt == 7'd69)   
            cnt <= 7'd0;
        else
            cnt <= cnt + 7'd1;
    end

// submit hw02

    always @(*) begin
        red_en    = 1'b0;
        green_en  = 1'b0;
        yellow_en = 1'b0;
        if(cnt <= 7'd29) begin         
            red_en = 1'b1;
        end
        else if(cnt <= 7'd59) begin   
            green_en = 1'b1;
        end
        else begin                      
            yellow_en = 1'b1;
        end
    end

    led u_led_red (red_en, red);
    led u_led_green (green_en, green);
        led u_led_yellow (yellow_en ? clk_1s : 1'b0, yellow);
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top_tb);
        $monitor("time=%0t, cnt=%0d | red=%b, green=%b, yellow=%b",$time,cnt,red,green,yellow);
        #210;
        $finish;
    end
endmodule