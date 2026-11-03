module cd4017 (clk, ce, clr, cout, q);
    input clk, ce ,clr;
    reg [3:0] count = 0;
    output reg cout = 0;
    output [7:0] q;
    always @(posedge clk or negedge clr)
    begin
        
        if(!clr)
            begin
                count <= 0;
                cout <= 0;
            end
        else if(count == 7 && !ce)
            begin
                count <= 0;
                cout <= 1;
            end
        else if(!ce)
            begin
                cout <= 0;
                count <= count + 1;
            end
    end
    assign q = 8'b00000001 << count;
endmodule