//implement a circuit that adds two 8-bit 2's complement numbers and outputs whether or not a signed overflow has occurred.

module top_module (
    input [7:0] a, b,
    output [7:0] s,
    output overflow
);
    assign s = a + b;
    assign overflow = (a[7] ^ s[7]) & (b[7] ^ s[7]);
endmodule