module cd4017(clk,reset,inhibit,carry_out,q);
		input clk,reset,inhibit;
		output reg carry_out;
		output reg [9:0] q;
		reg [3:0] count;

		always@(posedge clk or posedge reset)
		begin
    					if(reset)
    							begin
        									count <= 4'd0;
        									q <= 10'b0000000001;
        									carry_out <= 1'b0;
    							end
    					else if(!inhibit)
							begin
        									if(count == 4'd9)
        													begin
            															count <= 4'd0;
            															q <= 10'b0000000001;
            															carry_out <= 1'b1;
        													end
        				else
        													begin
            															count <= count + 4'd1;
            															q <= q << 1;
            															carry_out <= 1'b0;
        													end
    							end
    					else begin
        									carry_out <= 1'b0;
    					end
end
endmodule