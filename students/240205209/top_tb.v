module top_tb;
    wire       clk;
    wire       tens_clk;
    wire       carry_units;
    wire       carry_tens;
    wire [9:0] q_units;
    wire [9:0] q_tens;
    reg        reset;

    clk_gen u_clk_gen (clk);
    cd4017 u_units (clk, reset, 1'b0, carry_units, q_units);
    assign tens_clk = ~carry_units;
    cd4017 u_tens (tens_clk, reset, 1'b0, carry_tens, q_tens);

    initial 
	begin
        	reset = 1'b1;
        	#5 reset = 1'b0;
   	end

    initial 
	begin
        	$dumpfile("ok.vcd");          
        	$dumpvars(0, top_tb);          
       	 	#2500 $finish;
    	end
endmodule