module top_tb;
	wire clk;
	wire [9:0] q;
	wire carry_out;
	wire [7:0] led; 
	reg reset;
	reg inhibit;

	clk_gen u_clk(.clk(clk));

cd4017 u_cd4017(
    .clk(clk),
    .reset(reset),
    .inhibit(inhibit),
    .carry_out(carry_out),
    .q(q)
);

generate
    genvar i;
    for(i=0; i<8; i=i+1) begin: led_inst
        led u_led(.clk(q[i]), .out(led[i]));
    end
endgenerate

initial begin
    reset = 1'b1;
    inhibit = 1'b1;
    #20;
    reset = 1'b0;
    inhibit = 1'b0;
    #400;
    $finish;
end

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, top_tb);
end

endmodule
