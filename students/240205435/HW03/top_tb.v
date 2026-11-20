module top_tb;
    wire clk;
    wire carry_out_one,carry_out_ten;
    wire [9:0] q_one,q_ten;

    clk_gen u_clk_gen(clk);

    cd4017 u_cd4017_one(clk,1'b0,1'b0,carry_out_one,q_one);
    cd4017 u_cd4017_ten(carry_out_one,1'b0,1'b0,carry_out_ten,q_ten);

    initial
    begin
        $dumpfile("done.vcd");
        $dumpvars();

        #2500 $finish();

    end
endmodule