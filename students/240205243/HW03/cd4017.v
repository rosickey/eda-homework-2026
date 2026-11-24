module cd4017 (CP, EN, MR, Q, CO);
    input CP;
    input EN;
    input MR;
    output [9:0] Q;
    output CO;
    
    reg [3:0] cnt;
    reg [9:0] Q;
    
    // 时序计数逻辑
    always @(posedge CP or posedge MR) begin
        if (MR) begin
            cnt <= 4'd0;
        end
        else if (~EN) begin
            if (cnt == 4'd9) begin
                cnt <= 4'd0;
            end
            else begin
                cnt <= cnt + 4'd1;
            end
        end
    end
    
    // 组合逻辑：译码输出独热码 Q0~Q9
    always @(cnt) begin
        case (cnt)
            4'd0: Q = 10'b0000000001;
            4'd1: Q = 10'b0000000010;
            4'd2: Q = 10'b0000000100;
            4'd3: Q = 10'b0000001000;
            4'd4: Q = 10'b0000010000;
            4'd5: Q = 10'b0000100000;
            4'd6: Q = 10'b0001000000;
            4'd7: Q = 10'b0010000000;
            4'd8: Q = 10'b0100000000;
            4'd9: Q = 10'b1000000000;
            default: Q = 10'b0000000001;
        endcase
    end
    
    // 进位输出 CO：计数 0~4 为高，5~9 为低
    assign CO = (cnt < 4'd5) ? 1'b1 : 1'b0;
    
endmodule
