module cd4017(clk,reset,inhibit,carry_out,q);
    input clk;
    input wire reset;
    input wire inhibit;
    output wire carry_out;
    output wire [7:0] q;
    reg [3:0] count = 0;
    always@(posedge clk or posedge reset)
    begin
        if(reset)
                count  <= 0;
        else if(!inhibit)
            begin
                if(count == 7)
                    count <= 0;
                else
                    count <= count + 1;
            end
    end
    assign carry_out = (count == 9);
    assign q = 10'b00_0000_0001 << count ;
endmodule