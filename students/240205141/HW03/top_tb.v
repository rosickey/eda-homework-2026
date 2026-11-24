
module top_tb;
wire clk;      
wire reset;        
wire inhibit;      
wire carry_out_0; 
wire [9:0] q0;   
wire carry_out_1;  
wire [9:0] q1;    
clk_gen u_clk_gen(
    .clk(clk)
);
cd4017 u_cd4017_0(
    .clk(clk),
    .reset(reset),
    .inhibit(inhibit),  
    .carry_out(carry_out_0),
    .q(q0)
);
cd4017 u_cd4017_1(
    .clk(clk),
    .reset(reset),
    .inhibit(carry_out_0),  
    .carry_out(carry_out_1),
    .q(q1)
);
initial begin
    reset = 1;  
    #10 reset = 0;  
end
initial begin
    #200 $finish;
end
initial begin
    $dumpfile("done.vcd");
    $dumpvars(0, top_tb);
end

endmodule