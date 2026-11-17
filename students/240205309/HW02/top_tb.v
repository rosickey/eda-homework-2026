module top_tb(clk_1s,en,hold,red,yellow,green);
 input clk_1s;
 output reg en,hold;
 output red,yellow,green;
 reg red_blink;
 reg yellow_blink;
 reg green_blink;
 reg [1:0] state;
 reg [5:0] red_time;
 reg [5:0] yellow_time;
 reg [5:0] green_time;
 reg [1:0] temp;
 reg [1:0] lamp;
 clk_gen_1s u_clk_gen(clk_1s);
 led u_red(clk_1s,red_blink,red);
 led u_yellow(clk_1s,yellow_blink,yellow);
 led u_green(clk_1s,green_blink,green);
 always@(*)
 begin
     if(!en)
     begin
         red_time   = 6'd30;
         yellow_time= 6'd10;
         green_time = 6'd30;
         temp = 2'd0;
     end
 end
 always@(posedge clk_1s or posedge hold)
 begin
     if (hold)
     begin
         state <= 2'd0;
         temp <= 2'd0;
         lamp <= 2'd3;
     end
     else if(en)
     begin
         if(temp == 2'd0)
         begin
             temp <= 2'd1;
             state <= 2'd0;
             red_time <= 6'd30;
         end
         else
         begin
             case(state)
                 2'd0: 
                 begin
                     lamp <= 2'd0;
                     if(red_time > 0)
                         red_time <= red_time - 1'd1;
                     else
                     begin
                         state <= 2'd1; 
                         yellow_time <= 6'd10;
                     end
                 end
                 2'd1: 
                 begin
                     lamp <= 2'd1;
                     if(yellow_time > 0)
                         yellow_time <= yellow_time - 1'd1;
                     else
                     begin
                         state <= 2'd2; 
                         green_time <= 6'd30;
                     end
                 end
                 2'd2: 
                 begin
                     lamp <= 2'd2;
                     if(green_time > 0)
                         green_time <= green_time - 1'd1;
                     else
                     begin
                         state <= 2'd1; 
                         yellow_time <= 6'd10;
                     end
                 end
             endcase
         end
     end
 end
 always@(*)
 begin
     red_blink = 1'b0;
     yellow_blink = 1'b0;
     green_blink = 1'b0;
     if(en)
     begin
         case(state)
             2'd0: red_blink = 1'b0;    
             2'd1: yellow_blink = 1'b1; 
             2'd2: green_blink = 1'b0;  
         endcase
     end
 end
 initial begin
     $dumpfile("wave.vcd");
     $dumpvars(0,top_tb);
     hold = 1'b1;
     en = 1'b0;
     #10 hold = 1'b0;
     #10 en = 1'b1;
 end
 endmodule