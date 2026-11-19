module top_tb;
    reg reset;
    wire clk;
    wire [9:0] q_unit;
    wire [9:0] q_tens;
    wire carry_unit;

    clk_gen u_clk_gen(clk);

    cd4017 u_unit(clk, reset, 1'b0, carry_unit, q_unit);

    cd4017 u_tens(carry_unit, reset, 1'b0, , q_tens);

    initial
    begin
        reset = 1'b1;
        #20;
        reset = 1'b0;
        #3000;
        $finish;
    end

    initial
    begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top_tb);
    end
endmodule
