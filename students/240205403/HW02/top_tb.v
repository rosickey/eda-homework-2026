module top_tb;
	wire clk;
	wire out;
	reg [6:0] count;
	reg red,green,yellow;
	clk_gen_1s u_clk(clk);
	led u_led(clk,out);
	initial begin
		count=0;
		yellow=0;
		green=0;
		red=0;
	end	
	always@(posedge clk)
	begin
		if(count==70)
		begin
			count=0;
		end
		else  begin
			count<=count + 1;
		end
	end
	always@(posedge clk)
	begin
		if(count<30)
		begin	
			green=1;
			yellow=0;
			red=0;
		end
		else if(count<60)
		begin
			green=0;
			yellow=0;
			red=1;
		end
		else begin
			green=0;
			yellow=~yellow;
			red=0;
		end
	end
initial begin
   	 $dumpfile("okk");
         $dumpvars();
         #120000 $finish;
     end
 endmodule