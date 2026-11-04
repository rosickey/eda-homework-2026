module led(I, O);
    input wire I;
    output reg O;

    always @(*)
    begin
        O <= I;
    end

endmodule