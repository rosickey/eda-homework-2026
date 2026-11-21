module top_tb;
	wire clk;
	wire [9:0] q_unit;
	wire [9:0] q_ten;
	wire co_unit;
	wire co_ten;
	reg reset;
	reg co_delay;
	clk_gen u_clk(clk);
	cd4017 u_unit(clk, reset, 1'b0, co_unit, q_unit);
	always @(posedge clk) begin
    	co_delay <= co_unit;
	end
	wire ten_clk = co_delay & (~co_unit);
	cd4017 u_ten(ten_clk, reset, 1'b0, co_ten, q_ten);
	initial 
	begin
        $dumpfile("wave.vcd");
        $dumpvars();
        reset = 1'b1;
        #15
        reset = 1'b0;
        #800
        $finish;
end
endmodule