`timescale 1ms/1ms
module top_tb;
wire clk;
wire red_out,yellow_out,green_out;
reg red,yellow,green;
reg [1:0] state;
reg [5:0] sec_cnt;

clk_gen_1s u_clk(clk);
led u_red(red,red_out);
led u_yellow(yellow,yellow_out);
led u_green(green,green_out);

initial begin
    state = 2'b00; 
    sec_cnt = 6'd30; 
end

always @(posedge clk)
begin
    		if(sec_cnt > 6'd1)
	begin
       		sec_cnt <= sec_cnt - 6'd1;
	end
    else begin
        case(state)
           	2'b00:
		begin 
               	state <= 2'b01;
                sec_cnt <= 6'd10;
            	end
            2'b01:
		begin  
                state <= 2'b10;
                sec_cnt <= 6'd30;
            end
            2'b10:
		begin  
                state <= 2'b00;
                sec_cnt <= 6'd30;
            end
            default:
		begin
                state <= 2'b00;
                sec_cnt <= 6'd30;
            	end
        endcase
    end
end
always @(*) begin
    red=1'b0;
    yellow=1'b0;
    green=1'b0;
    case(state)
        2'b00: green=1'b1;      
        2'b01: yellow=clk;    
        2'b10: red=1'b1;      
        default: ;
    endcase
end
initial begin
    $dumpfile("done");
    $dumpvars(0,clk,green,yellow,red);
    #140000;
    $finish;
end
endmodule
