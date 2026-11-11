module top_tb;
 wire clk_1s;
 reg red_en;
 reg green_en;
 reg yellow_en;
 wire red_led;
 wire green_led;
 wire yellow_led;
 clk_gen_1s u_clk_gen_1s(
     .clk_1s(clk_1s)
 );
 led u_led_red(
     .en(red_en),
     .clk_1s(clk_1s),
     .led_out(red_led)
 );
 led u_led_green(
     .en(green_en),
     .clk_1s(clk_1s),
     .led_out(green_led)
 );
 led u_led_yellow(
     .en(yellow_en),
     .clk_1s(clk_1s),
     .led_out(yellow_led)
 );
 reg [5:0] cnt;
 reg [1:0] state;
 reg clk_1s_r;
 wire sec_pulse;
initial
	begin
		$dumpfile("ok");
		$dumpvars();
	end
 always @(posedge clk_1s) begin
     clk_1s_r <= clk_1s;
 end
 assign sec_pulse = clk_1s && (~clk_1s_r);
 always @(posedge clk_1s) begin
     if(sec_pulse) begin
         case(state)
             0: begin
                 red_en <= 1'b1;
                 green_en <= 1'b0;
                 yellow_en <= 1'b0;
                 if(cnt == 6'd29) begin
                     cnt <= 6'd0;
                     state <= 2'd1;
                 end
                 else begin
                     cnt <= cnt + 1'd1;
                 end
             end
             1: begin
                 red_en <= 1'b0;
                 green_en <= 1'b0;
                 yellow_en <= 1'b1;
                 if(cnt == 6'd9) begin
                     cnt <= 6'd0;
                     state <= 2'd2;
                 end
                 else begin
                     cnt <= cnt + 1'd1;
                 end
             end
             2: begin
                 red_en <= 1'b0;
                 green_en <= 1'b1;
                 yellow_en <= 1'b0;
                 if(cnt == 6'd29) begin
                     cnt <= 6'd0;
                     state <= 2'd0;
                 end
                 else begin
                     cnt <= cnt + 1'd1;
                 end
             end
             default: begin
                 state <= 2'd0;
                 cnt <= 6'd0;
             end
         endcase
     end
 end
 initial begin
     #12000;
     $stop;
 end
 endmodule