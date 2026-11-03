module led(A, Q);
    input wire A;
    output reg Q;

    always @(*)
    begin
        Q <= A;
    end

endmodule