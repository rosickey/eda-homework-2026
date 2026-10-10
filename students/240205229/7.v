module dff(clk,reset,d,q)
    input clk,reset;
    input d;
    output q;
    reg q;
    always@(posedge clk)
       begin
            if(reast)
q<=0;
            else
q<=d;
end
endmodule
