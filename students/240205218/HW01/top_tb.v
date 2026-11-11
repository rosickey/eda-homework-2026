`timescale 1ns/1ps
module top_tb;
    wire clk;
    wire [9:0] q;

    clk_gen clk_gen_inst(
        .clk(clk)
    );

    cd4017 cd4017_inst(
        .clk(clk),
        .rst(1'b0),
        .q(q)
    );

    genvar i;
    generate
        for(i=0;i<8;i=i+1) begin
            led led_inst(
                .in(q[i])
            );
        end
    endgenerate

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0,top_tb);
        #500 $finish;
    end
endmodule
