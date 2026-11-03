module top_tb;
    wire clk;
    wire [7:0] q;
    wire [7:0] out;
    clk_gen U_clk_gen(clk);
    led u_led1 (q[0], out[0]);
    led u_led2 (q[1], out[1]);
    led u_led3 (q[2], out[2]);
    led u_led4 (q[3], out[3]);
    led u_led5 (q[4], out[4]);
    led u_led6 (q[5], out[5]);
    led u_led7 (q[6], out[6]);
    led u_led8 (q[7], out[7]);

    cd4017 U_cd4017(clk, 1'b0, 1'b1, cout, q);
    initial begin
        $dumpfile("done");
        $dumpvars();
        $monitor();
        #2000 $finish();
    end

endmodule