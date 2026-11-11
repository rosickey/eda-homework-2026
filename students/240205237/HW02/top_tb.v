module test_led;

    wire clk;
    reg [5:0] num;     
    parameter S_RED    = 2'd0; 
    parameter S_GREEN  = 2'd1; 
    parameter S_YELLOW = 2'd2; 
    
    reg [1:0] state;

    reg red_in;
    reg green_in;
    wire yellow_in;
    
    wire out_red;
    wire out_green;
    wire out_yellow;

    clk_gen u_clk(clk);

    led u_red(red_in, out_red);
    led u_green(green_in, out_green);
    led u_yellow(yellow_in, out_yellow);

    always @ (posedge clk) begin
        if (num == 0) begin
            case (state)
                S_RED: begin
                    state <= S_GREEN;
                    num <= 29;   
                end
                S_GREEN: begin
                    state <= S_YELLOW;
                    num <= 9;    
                end
                S_YELLOW: begin
                    state <= S_RED;
                    num <= 29;   
                end
                default: begin
                    state <= S_RED;
                    num <= 29;
                end
            endcase
        end else begin
            num <= num - 1; 
        end
    end

    always @ (*) begin
        red_in = 1'b0;
        green_in = 1'b0;
        
        case (state)
            S_RED: begin
                red_in = 1'b1;    
            end
            S_GREEN: begin
                green_in = 1'b1;  
            end
        endcase
    end

    assign yellow_in = (state == S_YELLOW) ? clk : 1'b0;

    initial begin
        state = S_RED;
        num = 6'd29;  // 初始红灯30s
        
        $dumpfile("done");
        $dumpvars();
        
        #800 $finish; 
    end

endmodule