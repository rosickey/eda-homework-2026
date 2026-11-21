module test_10;
wire clk;
wire dummy_out;
wire carry_ones;
reg reset;
wire [9:0] ones;
wire [9:0] tens;
 clk_gen u(clk);
 CD4017 u_ones(clk,reset,ones,carry_ones,1'b0);
 CD4017 u_tens(clk,reset,tens,dummy_out,~ones[9]);
initial begin
    reset=1;
    #35 reset =0;
    $dumpfile("10.vcd");
    $dumpvars();
    #30000 $finish;
end
endmodule