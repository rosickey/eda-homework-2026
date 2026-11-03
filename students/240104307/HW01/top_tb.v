module tb_top;
wire clk_sig;
wire [9:0] q;
wire l1,l2,l3,l4,l5,l6,l7,l8;
reg rst;
clk_gen u_clk(clk_sig);
cd4017 u_cd4017(
    .clk(clk_sig),
    .rst(rst),
    .inh(1'b0),
    .q(q)
);
led_cathode u_led0(.square_in(q[0]), .led(l1));
led_cathode u_led1(.square_in(q[1]), .led(l2));
led_cathode u_led2(.square_in(q[2]), .led(l3));
led_cathode u_led3(.square_in(q[3]), .led(l4));
led_cathode u_led4(.square_in(q[4]), .led(l5));
led_cathode u_led5(.square_in(q[5]), .led(l6));
led_cathode u_led6(.square_in(q[6]), .led(l7));
led_cathode u_led7(.square_in(q[7]), .led(l8));
initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,tb_top);
    $monitor("t=%0t,clk_sig=%b,l1=%b,l2=%b,l3=%b,l4=%b,l5=%b,l6=%b,l7=%b,l8=%b",$time,clk_sig,l1,l2,l3,l4,l5,l6,l7,l8);
    rst = 1'b1;
    #20 rst = 1'b0;
    #400 $finish;  
end
endmodule
