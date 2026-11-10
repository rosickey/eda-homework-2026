`timescale 1ns/1ns
module top_tb;
wire clk_1s;
wire led_red, led_green, led_yellow;

reg [6:0] count;
reg green_en;
reg yellow_en;
reg red_en;

clk_gen u_clk_1s(
    .clk(clk_1s)
);

initial begin
    count = 7'd0;
    green_en  = 1'b0;
    yellow_en = 1'b0;
    red_en    = 1'b0;
    $dumpfile("wave.vcd");
    $dumpvars(0, top_tb);
end

always @(posedge clk_1s) begin
    count <= (count == 7'd69) ? 7'd0 : count + 1'd1;
    case (1'b1)
        (count < 30): begin
            green_en  <= 1'b1;
            yellow_en <= 1'b0;
            red_en    <= 1'b0;
        end
        (count < 40): begin
            green_en  <= 1'b0;
            yellow_en <= 1'b1;
            red_en    <= 1'b0;
        end
        default: begin
            green_en  <= 1'b0;
            yellow_en <= 1'b0;
            red_en    <= 1'b1;
        end
    endcase
end

wire in_g, in_y, in_r;
assign in_g = green_en;
assign in_y = yellow_en ? clk_1s : 1'b0;
assign in_r = red_en;

led u_led_green(
    .clk(in_g),
    .led(led_green)
);
led u_led_yellow(
    .clk(in_y),
    .led(led_yellow)
);
led u_led_red(
    .clk(in_r),
    .led(led_red)
);

initial begin
    #70000000000;
    $display("Simulation finish");
    $finish;
end
endmodule
