module led(clk,red,green,yellow);
	input clk;
	output reg red;
	output reg green;
	output reg yellow;
	reg [6:0] count;
	initial begin
		count=7'd0;
	end
	always@(posedge clk)
	begin
		if(count == 7'd70)
		begin
        		count <= 7'd0;
   		end
		else begin
        	count <= count + 1'd1;
    		end
	end
	always @(*) 
		begin
   			if(count < 7'd30) 
			begin
        			red = 1;
        			green = 0;
        			yellow = 0;
    			end
   	else if(count < 7'd60) 
		begin
        		red = 0;
        		green = 1;
			yellow = 0;
		end
   	else begin
        	red = 0;
        	green = 0;
        	yellow = clk;
    	end
	end
endmodule
