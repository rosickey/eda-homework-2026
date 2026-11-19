module test_counter;
wire clk;
reg reset;   
reg inhibit;
wire [9:0] q0; 
wire carry_out0;  
wire [9:0] q1;   
wire carry_out1; 

clk_gen u_clk(clk);
cd4017 u_cd4017_low(clk,reset,inhibit,carry_out0,q0);
cd4017 u_cd4017_high(carry_out0,reset,1'b0,carry_out1,q1);
initial 
begin
	$dumpfile("wave.vcd");
    	$dumpvars();
	reset =1'b1;
	inhibit=1'b0;
	#5 reset =1'b0;
    	#2000 $finish();
end
endmodule
