module top_tb;
    wire clk;
    wire [9:0] q;          
    reg [7:0] led_clk;    
    wire [7:0] out;   

    clk_gen u_clk(.clk(clk));
    cd4017 u_4017(
        .clk(clk),
        .reset(1'b0),      
        .inhibit(1'b0),     
        .carry_out(),      
        .q(q)              
    );

    led u_led0(.clk(led_clk[0]), .out(out[0]));
    led u_led1(.clk(led_clk[1]), .out(out[1]));
    led u_led2(.clk(led_clk[2]), .out(out[2]));
    led u_led3(.clk(led_clk[3]), .out(out[3]));
    led u_led4(.clk(led_clk[4]), .out(out[4]));
    led u_led5(.clk(led_clk[5]), .out(out[5]));
    led u_led6(.clk(led_clk[6]), .out(out[6]));
    led u_led7(.clk(led_clk[7]), .out(out[7]));
    always @(*) 
    begin
	led_clk = q[7:0]; 
end
    initial begin
	top_tb.u_4017.count = 0;
        $dumpfile("done.vcd");         
	$dumpvars(0, top_tb);        
        #200 $finish;       
    end

endmodule