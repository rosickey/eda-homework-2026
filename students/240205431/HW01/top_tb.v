module top_tb;
wire clk;
wire[7:0] out;
wire [7:0] led_clk;
cd4017 h(1'b0,clk,1'b0,carry_out,led_clk);
clk_gen t(clk);
led led0(led_clk[0],out[0]);
led led1(led_clk[1],out[1]);
led led2(led_clk[2],out[2]);
led led3(led_clk[3],out[3]);
led led4(led_clk[4],out[4]);
led led5(led_clk[5],out[5]);
led led6(led_clk[6],out[6]);
led led7(led_clk[7],out[7]);
initial
begin
   $dumpfile("done") ;
   $dumpvars();
    #2000 $finish();
end
endmodule