module top_tb;
              wire clk;
              reg[7:0] cnt;
              reg green_en,yellow_en,red_en;
              wire led_g,led_y,led_r;
              wire clk_g,clk_y,clk_r;
              assign clk_g=green_en?clk:1'b0;
              assign clk_y=yellow_en?clk:1'b0;
              assign clk_r=red_en?clk:1'b0;
              clk_gen_1s u_clk(clk);
              led u_led_g(clk_g,led_g);
              led u_led_y(clk_y,led_y);
              led u_led_r(clk_r,led_r);
              initial begin
                        cnt=0;
                        green_en=1;
                        yellow_en=0;
                        red_en=0;
              end              
             always @(posedge clk) 
             begin
            
                      cnt<=cnt+1'b1;
                      if(green_en)
                      begin
                               if(cnt==8'd30)
                               begin
                                        green_en<=0;
                                        yellow_en<=1;
                                        cnt<=0;
                               end
                      end
                      else if(yellow_en)
                      begin
                               if(cnt==8'd10)
                               begin
                                        yellow_en<=0;
                                        red_en<=1;
                                        cnt<=0;
                               end
                      end
                      else if(red_en)
                      begin
                               if(cnt==8'd30)
                               begin
                                        red_en<=0;
                                        green_en<=1;
                                        cnt<=0;
                               end
                      end
            end
            initial begin
                       $dumpfile("done");
                       $dumpvars(0,top_tb);
                       #200 $finish;
            end
endmodule