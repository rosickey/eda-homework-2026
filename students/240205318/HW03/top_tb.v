module top_tb;
    wire clk;
    wire carry_out1,carry_out2;
    wire [9:0] q1,q2;
    clk_gen t_clk_gen(clk);
    cd4017 g(clk, 1'b0, 1'b0, carry_out1, q1);
    cd4017 s(carry_out1, 1'b0, 1'b0, carry_out2,q2);

    initial
    begin
        $dumpfile("done");
        $dumpvars();

        #40000 $finish;
    end

endmodule
