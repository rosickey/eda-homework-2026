module test_led;
wire clk;
reg reset;   
wire inhibit;
wire carry_out;
wire [9:0] q;
wire [7:0] out;

clk_gen u_clk(.clk(clk));
cd4017 u_4017(
    .clk(clk),
    .reset(reset),
    .inhibit(inhibit),
    .carry_out(carry_out),
    .q(q)
);

led led0(.clk(q[0]),.out(out[0]));
led led1(.clk(q[1]),.out(out[1]));
led led2(.clk(q[2]),.out(out[2]));
led led3(.clk(q[3]),.out(out[3]));
led led4(.clk(q[4]),.out(out[4]));
led led5(.clk(q[5]),.out(out[5]));
led led6(.clk(q[6]),.out(out[6]));
led led7(.clk(q[7]),.out(out[7]));

assign inhibit = 1'b0;  
initial
begin
    reset = 1'b1;
    #10;
    reset = 1'b0;
    $dumpfile("ok.vcd");
    $dumpvars();
    #190 $finish;
end
endmodule