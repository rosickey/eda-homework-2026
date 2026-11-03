module test_led;

    wire clk;
    wire reset;
    wire inhibit;
    wire carry_out;
    wire [9:0] q;

    wire lamp0, lamp1, lamp2, lamp3;
    wire lamp4, lamp5, lamp6, lamp7;

    clk_gen u_clk_gen(clk);

    reg rst_reg;
    initial begin
        rst_reg = 1;
        #15 rst_reg = 0;
    end

    assign reset   = rst_reg;
    assign inhibit = 1'b0;

    cd4017 u_cd4017 (
        .clk(clk),
        .reset(reset),
        .inhibit(inhibit),
        .carry_out(carry_out),
        .q(q)
    );

    led u_led0 (.in(q[0]),  .out(lamp0));
    led u_led1 (.in(q[1]),  .out(lamp1));
    led u_led2 (.in(q[2]),  .out(lamp2));
    led u_led3 (.in(q[3]),  .out(lamp3));
    led u_led4 (.in(q[4]),  .out(lamp4));
    led u_led5 (.in(q[5]),  .out(lamp5));
    led u_led6 (.in(q[6]),  .out(lamp6));
    led u_led7 (.in(q[7]),  .out(lamp7));

    initial begin
        $dumpfile("done.vcd");
        $dumpvars(0, test_led);
        #200 $finish;
    end

endmodule