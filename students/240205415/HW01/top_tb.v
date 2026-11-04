module led8(clk,led_out);
     input clk;
     output reg [7:0] led_out;
     reg [7:0] m;
     initial begin
         m = 8'b00000001;
     end
     always@(posedge clk) begin
        m <= { m[6:0],m[7] };
     end
     always @(*) begin
         if (clk)
             led_out =m;
         else
             led_out = 8'b00000000;
     end
 endmodule