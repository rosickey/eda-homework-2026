`timescale 1s/1s
module top_tb;

wire clk;
wire red_in, yellow_in, green_in;
wire red, yellow, green;

clk_gen_1s u_clk(clk);

led u_led_red  (in(red_in),   out(red));
led u_led_yellow(in(yellow_in),out(yellow));
led u_led_green(in(green_in), out(green));

localparam S_GREEN  = 2'd0;
localparam S_YELLOW = 2'd1;
localparam S_RED    = 2'd2;

reg [1:0] curr_state;
reg [5:0] timer;

initial begin
    curr_state = S_GREEN;
    timer = 0;
    $dumpfile("wave.vcd");
    $dumpvars(0, top_tb);
    #200 $finish(); 
end


always @(posedge clk) begin
    case(curr_state)
        S_GREEN: begin
            if(timer == 6'd29) begin
                curr_state <= S_YELLOW;
                timer <= 6'd0;
            end
            else begin
                timer <= timer + 1'd1;
            end
        end
        S_YELLOW: begin
            if(timer == 6'd9) begin
                curr_state <= S_RED;
                timer <= 6'd0;
            end
            else begin
                timer <= timer + 1'd1;
            end
        end
        S_RED: begin
            if(timer == 6'd29) begin
                curr_state <= S_GREEN;
                timer <= 6'd0;
            end
            else begin
                timer <= timer + 1'd1;
            end
        end
        default: begin
            curr_state <= S_GREEN;
            timer <= 0;
        end
    endcase
end

assign green_in  = (curr_state == S_GREEN) ? 1'b1 : 1'b0;
assign yellow_in = (curr_state == S_YELLOW) ? clk  : 1'b0;
assign red_in    = (curr_state == S_RED)   ? 1'b1 : 1'b0;

endmodule
