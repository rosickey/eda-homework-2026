module top_tb;
	wire clk;
	wire [9:0] q_unit;   
	wire [9:0] q_tens;   
	wire carry_unit; 
	wire carry_tens;    
	reg reset;
	reg inhibit_unit, inhibit_tens;
	clk_gen u_clk (clk);
	cd4017 u_unit (clk,reset,inhibit_unit,carry_unit,q_unit);
	cd4017 u_tens (carry_unit, reset,inhibit_tens,carry_tens,q_tens);
initial begin
    $dumpfile("wave.vcd");
    $dumpvars();
    reset = 1'b1;
    inhibit_unit = 1'b0;
    inhibit_tens = 1'b0;
    #5 reset = 1'b0;
    #2000 $finish;
end
endmodule

	 
