`timescale 1s/100ms

module led(P, Q);
    input P;
    wire P;
    output Q;
    reg Q;

    always @(P)
    begin
        Q <= P;
    end
endmodule