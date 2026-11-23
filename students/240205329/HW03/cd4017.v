module top_tb;
	wire       clk_wire;
	wire       carry_out_wire;
	wire [9:0] q_wire;

	wire led_out_0, led_out_1, led_out_2, led_out_3;
	wire led_out_4, led_out_5, led_out_6, led_out_7;

	reg  reset_reg;

	module top_tb;
wire clk_ls;
wire red, yellow, green;
reg red_in, yellow_in, green_in;
clk_gen_ls u_clk_ls(clk_ls);
led u_red(red_in,red);
led u_yellow(yellow_in,yellow);
led u_green(green_in,green);
reg [6:0] cnt;
reg [1:0] state;
parameter S_RED    = 2'd0;
parameter S_GREEN  = 2'd1;
parameter S_YELLOW = 2'd2;
initial begin
$dumpfile("done");
$dumpvars();
cnt = 7'd0;
state = S_RED;
$monitor("time=%0t, red=%b, yellow=%b, green=%b, state=%0d",$time,red,yellow,green,state);
#800 $finish; 
end
always @(posedge clk_ls) begin
    case(state)
        S_RED: begin
            if(cnt == 7'd29) begin   
                cnt <= 7'd0;
                state <= S_GREEN;
            end
            else begin
                cnt <= cnt + 1'b1;
            end
        end
        S_GREEN: begin
            if(cnt == 7'd29) begin   
                cnt <= 7'd0;
                state <= S_YELLOW;
            end
            else begin
                cnt <= cnt + 1'b1;
            end
        end
        S_YELLOW: begin
            if(cnt == 7'd9) begin    
                cnt <= 7'd0;
                state <= S_RED;
            end
            else begin
                cnt <= cnt + 1'b1;
            end
        end
module cd4017(clk,reset,inhibit,carry_out,q);
	input clk,reset,inhibit;
	output carry_out;
	output[9:0] q;
	reg [3:0] count=0;
	always@(posedge clk or posedge reset)
		begin
			if(reset)
				count<=0;
			else if(!inhibit)
				begin
					if(count==9)
						count<=0;
					else
						count<=count+1;
				end
		end
	assign carry_out=(count==0);
	assign q=10'd1<<count;
endmodule
 9 changes: 9 additions & 0 deletions9  
students/240205336/HWO3/clk_gen.v
Original file line number	Diff line number	Diff line change
@@ -0,0 +1,9 @@
module clk_gen(clk);
	output clk;
	reg clk;
	initial
	begin
		clk<=0;
		forever #10 clk=~clk;
	end
endmodule