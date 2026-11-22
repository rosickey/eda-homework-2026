module cd4017(clk, reset, inhibit, carry_out, q);
	input clk, reset, inhibit;
	output carry_out;
	output [9:0] q;
	reg [3:0] cnt;
	always@(posedge clk or posedge reset)
	begin
		if(reset)
            		cnt<=0;
		else if(!inhibit)
		begin
        		if(cnt==9)
               			cnt<=0;
            		else
                		cnt<= cnt +1;
        	end
    	end
		assign carry_out=(cnt==9);
    		assign q = 10'b00_0000_0001 << cnt;
endmodule