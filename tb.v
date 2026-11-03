module test;
wire clk;
wire [7:0] led_out;
reg [7:0] shift;

clk_gen u_clk(.clk(clk));

wire clk0 = clk & shift[0];
wire clk1 = clk & shift[1];
wire clk2 = clk & shift[2];
wire clk3 = clk & shift[3];
wire clk4 = clk & shift[4];
wire clk5 = clk & shift[5];
wire clk6 = clk & shift[6];
wire clk7 = clk & shift[7];

led u0(.clk(clk0), .out(led_out[0]));
led u1(.clk(clk1), .out(led_out[1]));
led u2(.clk(clk2), .out(led_out[2]));
led u3(.clk(clk3), .out(led_out[3]));
led u4(.clk(clk4), .out(led_out[4]));
led u5(.clk(clk5), .out(led_out[5]));
led u6(.clk(clk6), .out(led_out[6]));
led u7(.clk(clk7), .out(led_out[7]));

initial begin
    shift = 8'b00000001;
    $dumpfile("wave.vcd");
    $dumpvars(0, test);
end

always @(posedge clk) begin
    shift <= {shift[6:0], shift[7]};
end

initial begin
    #400 $finish;
end
endmodule

	
