module led(P, Q);
    input P;
    wire P;
    output Q;
    reg Q;

    always @(*)
    begin
        Q <= P;
    end

endmodule
