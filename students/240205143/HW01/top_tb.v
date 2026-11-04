module top_tb;
    wire clk_wire;      
    wire reset_wire;   
    wire inhibit_wire;  
    wire carry_out_wire; 
    wire [9:0] q_wire;  
    wire led_out_0, led_out_1, led_out_2, led_out_3;
    wire led_out_4, led_out_5, led_out_6, led_out_7;  
    reg reset_reg;
    assign reset_wire = reset_reg;
    initial begin
        reset_reg = 1; 
        #25;          
        reset_reg = 0; 
    end
    clk_gen u_clk_gen (clk_wire);
    cd4017 u_cd4017 (clk_wire, reset_wire, 1'b0, carry_out_wire, q_wire);
    led u_led_0 (q_wire[0], led_out_0);
    led u_led_1 (q_wire[1], led_out_1);
    led u_led_2 (q_wire[2], led_out_2);
    led u_led_3 (q_wire[3], led_out_3);
    led u_led_4 (q_wire[4], led_out_4);
    led u_led_5 (q_wire[5], led_out_5);
    led u_led_6 (q_wire[6], led_out_6);
    led u_led_7 (q_wire[7], led_out_7);
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars();
        #300; 
        $finish;
    end
endmodule