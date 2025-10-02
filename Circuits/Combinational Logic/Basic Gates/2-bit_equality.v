//given two 2-bit inputs A, B, implement a module that outputs 1 iff A = B.

module top_module (
    input [1:0] A,
    input [1:0] B,
    output z
);
    assign z = (A == B) ? 1'b1 : 1'b0;
endmodule