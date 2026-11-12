module top_tb;
		wire clk;
		wire red,yellow,green;
		reg red_1,yellow_1,green_1;
		reg [1:0] s;
		reg [6:0] t;

		clk_gen_1s u_clk(clk);

		led u1(red_1,red);
		led u2(green_1,green);
		led u3(yellow_1,yellow);

always @(posedge clk)
		begin
			t <= t + 7'd1;
		case(s)
			2'd0: begin 
		if(t >= 7'd29) begin 
			s <= 2'd1;
			t <= 7'd0;
		end
	end
			2'd1: begin 
		if(t >= 7'd29) begin
			s <= 2'd2;
			t <= 7'd0;
		end
	end
			2'd2: begin
		if(t >= 7'd9) begin
			s <= 2'd0;
			t <= 7'd0;
		end
	end
endcase
end

		always @(*) begin
			red_1 = 1'b0;
			yellow_1 = 1'b0;
 			green_1 = 1'b0;
		case(s)
			2'd0: red_1 = 1'b1;
			2'd1: green_1 = 1'b1;
			2'd2: yellow_1 = clk;
	endcase
end

		initial begin
			$dumpfile("done");
			$dumpvars();
			s = 2'd0;
			t = 7'd0;
			#120000 $finish();
		end
endmodule
