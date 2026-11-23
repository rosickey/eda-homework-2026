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
module top_tb;
	wire clk;
	wire cout, tens_cout;
	wire [9:0] q, tens_q;
	clk_gen clk_gen1(clk);
	cd4017 ones_place(clk, 1'b0, 1'b0, cout, q);
	cd4017 tens_place(cout, 1'b0, 1'b0, tens_cout, tens_q);
	initial
		begin
			$dumpfile("wave");
			$dumpvars();
			#10000
			$finish;
		end
endmodule