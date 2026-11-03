module top_tb;
    wire clk;
    wire reset;
    wire inhibit;
    wire carry_out;
    wire [9:0] q;

    wire out0, out1, out2, out3;
    wire out4, out5, out6, out7;

   
    clk_gen u_clk_gen (
        .clk(clk)
    );


    cd4017 u_cd4017 (
        .clk(clk),
        .reset(reset),
        .inhibit(inhibit),
        .carry_out(carry_out),
        .q(q)
    );

 
    led u_led0 (.clk(q[0]), .out(out0));
    led u_led1 (.clk(q[1]), .out(out1));
    led u_led2 (.clk(q[2]), .out(out2));
    led u_led3 (.clk(q[3]), .out(out3));
    led u_led4 (.clk(q[4]), .out(out4));
    led u_led5 (.clk(q[5]), .out(out5));
    led u_led6 (.clk(q[6]), .out(out6));
    led u_led7 (.clk(q[7]), .out(out7));

    reg reset_reg;
    reg inhibit_reg;
    assign reset   = reset_reg;
    assign inhibit = inhibit_reg;

    initial begin
        reset_reg   = 1'b1;
        inhibit_reg = 1'b1;
        #15;
        reset_reg   = 1'b0;
        inhibit_reg = 1'b0;

        $dumpfile("report.vcd");
        $dumpvars(0, top_tb);

        #400 $finish;
    end
endmodule