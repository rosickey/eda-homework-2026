module cd4017 (
    CLK,
    EN,
    MR,
    Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9
);

input CLK;
input EN;
input MR;
output Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9;

reg [9:0] Q_reg;

always @(posedge CLK or posedge MR) begin
    if (MR) begin
        Q_reg <= 10'b0000000001;
    end
    else if (!EN) begin
        Q_reg <= {Q_reg[8:0], Q_reg[9]};
    end
end

assign Q0 = Q_reg[0];
assign Q1 = Q_reg[1];
assign Q2 = Q_reg[2];
assign Q3 = Q_reg[3];
assign Q4 = Q_reg[4];
assign Q5 = Q_reg[5];
assign Q6 = Q_reg[6];
assign Q7 = Q_reg[7];
assign Q8 = Q_reg[8];
assign Q9 = Q_reg[9];

endmodule
