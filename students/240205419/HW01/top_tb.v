module top_tb;
wire clk;
wire cout;
wire [7:0] I;
wire [7:0] O;
clk_gen u_clk_gen (clk);

cd4017 u_cd4017 (clk, 1'b0, 1'b0, cout, I);

led u_led1 (I[0], O[0]);
led u_led2 (I[1], O[1]);
led u_led3 (I[2], O[2]);
led u_led4 (I[3], O[3]);
led u_led5 (I[4], O[4]);
led u_led6 (I[5], O[5]);
led u_led7 (I[6], O[6]);
led u_led8 (I[7], O[7]);

initial 
begin
    $dumpfile("led.vcd");
    $dumpvars();
    
    #2000 $finish;
end
endmodule