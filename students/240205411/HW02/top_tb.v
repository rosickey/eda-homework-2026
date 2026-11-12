module top_tb;
	wire clk;
	wire red, yellow, green;
	reg red1, yellow1, green1;
	reg [1:0] s;
	reg [1:0] next_s;
	reg [6:0] t;
	clk_gen_1s  u_clk(clk);
	led u_led1(red1,red);
	led u_led2(green1,green);
	led u_led3(yellow1,yellow);
	always@(posedge clk)
	initial begin
		s=0;t=0;
	end 
	initial begin
    		t <= t + 1'd1;
   		case(s)
        	2'd0: begin 
           		 if(t >= 7'd29) begin 
                		s <= 2'd1;
                		t <= 7'd0;
       			end
        	end
       		2'd1: begin 
            		if(t >= 7'd29) begin
              			s <= 2'd2;
                		t <= 7'd0;
        		end
        	end
        	2'd2: begin
            		if(t >= 7'd9) begin
               			s <= 2'd0;
                		t <= 7'd0;
        		end
        	end
    		endcase
	end
	always @(*) 
		begin
		red1 = 1'b0;
		yellow1 = 1'b0;
		green1 = 1'b0;
		case(s)
			2'd0: red1 = 1'b1;
			2'd1: green1 = 1'b1;
			2'd2: yellow1 = clk;
		endcase
	end
	initial begin
		$dumpfile("done");
		$dumpvars();
		s = 2'd0;
		t = 7'd0;
		#130000 $finish();
	end
endmodule
