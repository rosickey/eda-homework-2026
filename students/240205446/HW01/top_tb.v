module top_tb;
wire clk;
wire [7:0] P;
wire [7:0] Q;
clk_gen u_clk (clk);
led u_led1 (P[0], Q[0]);
led u_led2 (P[1], Q[1]);
led u_led3 (P[2], Q[2]);
led u_led4 (P[3], Q[3]);
led u_led5 (P[4], Q[4]);
led u_led6 (P[5], Q[5]);
led u_led7 (P[6], Q[6]);
led u_led8 (P[7], Q[7]);

cd4017 u_cd4017 (clk, 1'b0, 1'b1, cout, P);

initial 
begin
    $dumpfile("led.vcd");
    $dumpvars();

    #1000 $finish;
end
endmodule