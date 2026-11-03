module top_tb;
wire clk;
wire [7:0] A;
wire [7:0] Q;
clk_gen u_clk (clk);
led u_led1 (A[0], Q[0]);
led u_led2 (A[1], Q[1]);
led u_led3 (A[2], Q[2]);
led u_led4 (A[3], Q[3]);
led u_led5 (A[4], Q[4]);
led u_led6 (A[5], Q[5]);
led u_led7 (A[6], Q[6]);
led u_led8 (A[7], Q[7]);

cd4017 u_cd4017 (clk, 1'b0, 1'b1, cout, A);

initial 
begin
    $dumpfile("led.vcd");
    $dumpvars();

    #1000 $finish;
end
endmodule