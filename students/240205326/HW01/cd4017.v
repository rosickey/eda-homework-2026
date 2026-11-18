module cd4017(clk_i, rst_i, en_i, q_o);
    input clk_i;
    input rst_i;
    input en_i;
    output [9:0] q_o;
    reg [9:0] q_o;

    initial begin
        q_o = 10'b0000000001;  
    end

    always @(posedge clk_i) begin
        if (q_o[9])
            q_o <= 10'b0000000001;   
       else
            q_o <= q_o << 1;    
        end
endmodule