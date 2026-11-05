module cd4017(clk, reset, inhibit, cout, q);
    input clk, reset, inhibit;
    output cout;
    output [9:0] q;
    reg [3:0] count;
    always@(posedge clk or posedge reset)
    begin
        if(reset)
            count <= 0;
        else if(!inhibit)
        begin
            if(count == 9)
                count <= 0;
            else
                count <= count + 1;
        end
    end
    assign cout = (count == 9);
    assign q = 10'b00_0000_0001 << count;
endmodule
