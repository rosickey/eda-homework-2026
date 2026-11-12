`timescale 1s/1ms
module top_tb;
	wire clk_1s;
	wire red_out, green_out, yellow_out;
	reg rst;

	reg [6:0] cnt;
	reg [1:0] state;
	reg red_sig, green_sig, yellow_sig;
	clk_gen_1s u_clk(clk_1s);
	led u_led_red(red_sig,red_out);
	led u_led_green(green_sig, green_out);
	led u_led_yellow(yellow_sig, yellow_out);

	parameter s_red   = 2'd0;
	parameter s_yellow= 2'd1;
	parameter s_green = 2'd2;

	always @(posedge clk_1s or posedge rst) begin
    		if(rst) begin
        		state <= s_red;
        		cnt <= 7'd0;
    			end
    		else begin
        		case(state)
            s_red: begin
             		if(cnt == 7'd29) begin 
                    		state <= s_yellow;
                    		cnt <= 7'd0;
                	end
                else cnt <= cnt + 1'd1;
            		end 
             s_yellow: begin
                	if(cnt == 7'd9) begin         
                    		state <= s_green;  
                    		cnt <= 7'd0;
                	end
                else cnt <= cnt + 1'd1;
            		end
            s_green: begin
                	if(cnt == 7'd29) begin  
                    		state <= s_red; 
                    		cnt <= 7'd0;
                	end
                else cnt <= cnt + 1'd1;
            		end
            default: state <=s_red;
        	endcase
  	end
end

always @(*) begin
    case(state)
        s_red: begin
            red_sig   = 1'b1;
            green_sig = 1'b0;
            yellow_sig= 1'b0;
        end
       s_green: begin
            red_sig   = 1'b0;
            green_sig = 1'b1;
            yellow_sig= 1'b0;
        end
        s_yellow: begin
            red_sig   = 1'b0;
            green_sig = 1'b0;
            yellow_sig= clk_1s; 
        end
        default: begin
            red_sig   = 1'b0;
            green_sig = 1'b0;
            yellow_sig= 1'b0;
        end
    endcase
end

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,top_tb);
    rst = 1'b1;
    #1;             
    rst = 1'b0;
    #100;            
    $finish;
end
endmodule
