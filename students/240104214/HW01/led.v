module led(clk,out);
		input  clk;
		output reg out;
		always@( clk)
	begin
	out <= clk; 
end
endmodule
			
//assign out= clk;		

