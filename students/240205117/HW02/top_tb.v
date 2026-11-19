`timescale 1s/1s
module top_tb;

    wire  clk_gen;       
    reg  rst_n;         
         
    wire led_r, led_y, led_g; 

    reg  ctrl_r;
    reg  ctrl_y;
    reg  ctrl_g;

    clk_gen u_clk_gen (
        clk_1s
    );

    reg [6:0] sec_cnt; 
    
    always @(posedge clk_1s or negedge rst_n) begin
        if (!rst_n) begin
            sec_cnt <= 0;
        end else begin
            if (sec_cnt == 69) 
                sec_cnt <= 0; 
            else 
                sec_cnt <= sec_cnt + 1;
        end
    end

    always @(*) begin
        ctrl_r = 1'b1; 
        ctrl_y = 1'b1; 
        ctrl_g = 1'b1;

        if (sec_cnt < 30) begin
            ctrl_g = 1'b0; 
        end else if (sec_cnt < 40) begin
            ctrl_y = clk_1s; 
        end else begin
            ctrl_r = 1'b0;
        end
    end

    led u_led_r (
        ctrl_r, 
        led_r
    );

    led u_led_y (
        ctrl_y, 
        led_y
    );

    led u_led_g (
        ctrl_g, 
        led_g
    );

    initial begin
	$dumpfile("done");
	$dumpvars();
        rst_n = 0;
        #20 rst_n = 1; 
	#120;
	$finish;
    end

endmodule