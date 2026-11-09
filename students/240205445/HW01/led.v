module led(inp, outp);
    input wire inp;
    output reg outp;

    always @(*)
    begin
        outp <= inp;
    end

endmodule