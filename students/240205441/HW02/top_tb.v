`timescale 100ms/100ms
module top_tb;
	wire clk;
    	wire red_out, yellow_out, green_out;
    	reg  [7:0] red, yellow, green; 
	reg lamp;
	reg [1:0] count;
	reg [7:0] numa;                     
	clk_gen_1s u_clk(clk);
	led u_red ((count==0), red_out);    
	led u_yel ((count==2)&clk, yellow_out);   
	led u_gre ((count==1), green_out);   
	initial begin
		$dumpfile("o.vcd");
		$dumpvars(0, top_tb);
		green = 8'h30;              
		yellow = 8'h10; 
		red = 8'h30;
		lamp = 1;                    
		count = 2'd1; 
		numa = 8'h30;
		#2100 $finish;
	end
	always @(posedge clk)
	begin
		if (!lamp)
			begin
				lamp <= 1;
				case(count)
					0: begin numa <= green;  count <= 1; end
					1: begin numa <= yellow; count <= 2; end
					2: begin numa <= red;    count <= 0; end
					default: count <= 0;
				endcase
			end
		else
			begin
				if(numa > 1)
					if(numa[3:0] == 0)
						begin
							numa[3:0] <= 4'b1001;
							numa[7:4] <= numa[7:4] - 1;
						end
					else
						numa[3:0] <= numa[3:0] - 1;
				if(numa == 2) lamp <= 0;
			end
	end
endmodule
