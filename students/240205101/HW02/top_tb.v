module top_tb;
	wire clk_1s;
	reg red,green,yellow;
	wire red_out,green_out,yellow_out;
	reg [5:0] count;
	reg [1:0] state;
	clk_gen_1s u_clk(clk_1s);
	led u_red(red,red_out);
	led u_green(green,green_out);
	led u_yellow(yellow,yellow_out);
always @(posedge clk_1s) 
begin
	case(state)
	2'd0:begin
			if(count==6'd29)
			begin
				count<=6'd0;
				state<=2'd1;
			end
			else begin
				count <=count+1'b1;
			end
		end
	2'd1:begin
			if(count==6'd9)
			begin
				count<=6'd0;
				state<=2'd2;
			end
			else begin
				count <=count+1'b1;
			end
		end
	2'd2:begin
			if(count==6'd29)
			begin
				count<=6'd0;
				state<=2'd0;
			end
				else begin
			count <=count+1'b1;
			end
		end

	default:begin
			state<=2'd0;
			count<=6'd0;
		end
	endcase
end
   
always @(*)
	begin
	case(state)
		2'd0: 
		begin
			red= 1'b0;
                	green= 1'b1;
                	yellow= 1'b0;
                end
       		
		2'd1: 
		begin
			red=1'b0;
                	green=1'b0;
                	yellow=clk_1s;
                end
		
		2'd2: 
		begin
			red=1'b1;
                	green=1'b0;
                	yellow=0;
                end
		
		default: 
		begin
            		red= 1'b0;
            		green= 1'b0;
            		yellow= 1'b0;
        	end
	endcase
end

initial begin
    	$dumpfile("done.vcd");
   	$dumpvars();
	state<=2'd0;
	count<=6'd0;	
    	#75000;
   	$finish;
	end
endmodule