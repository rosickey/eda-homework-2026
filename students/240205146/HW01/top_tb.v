module test_led;

    wire clk;
    reg reset;   
    reg inhibit;
    wire carry_out;
    wire [9:0] q;
    wire [7:0] led_output;

    clk_gen u_clk_gen (clk);
    cd4017 u_4017(clk,reset,inhibit,carry_out,q);

    led_direct u_led0 (.clk(q[0]),.led(led_output[0]));
    led_direct u_led1 (.clk(q[1]),.led(led_output[1]));
    led_direct u_led2 (.clk(q[2]),.led(led_output[2]));
    led_direct u_led3 (.clk(q[3]),.led(led_output[3]));
    led_direct u_led4 (.clk(q[4]),.led(led_output[4]));
    led_direct u_led5 (.clk(q[5]),.led(led_output[5]));
    led_direct u_led6 (.clk(q[6]),.led(led_output[6]));
    led_direct u_led7 (.clk(q[7]),.led(led_output[7]));

    initial begin
    $dumpfile("done");
    $dumpvars();
    end

    initial begin
    reset = 1'b1;
    inhibit = 1'b0;
    #1 reset = 1'b0;
    #200 $finish;
    end

endmodule
