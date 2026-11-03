module led(q, out);
    input wire q;
    output reg out;

    always @(*)
    begin
        out = q;
    end

endmodule