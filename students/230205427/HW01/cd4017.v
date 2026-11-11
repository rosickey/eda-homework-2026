module cd4017(clk, reset, inhibit, cout, q);
    input        clk;
    input        reset;
    input        inhibit;
    output       cout;
    output [9:0] q;

    reg [3:0] count;

    always @(posedge clk or posedge reset)
    begin
        if (reset)
            count <= 4'd0;
        else if (!inhibit)
        begin
            if (count == 4'd9)
                count <= 4'd0;
            else
                count <= count + 1'b1;
        end
    end

    assign q    = 10'b00_0000_0001 << count;
    assign cout = (count == 4'd9);
endmodule
