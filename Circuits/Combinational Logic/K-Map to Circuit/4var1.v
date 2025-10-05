//implement the following 4 variable kmap
// ab\cd 00  01  11  10
// 00   | 1 | 1 | 0 | 1
// 01   | 1 | 0 | 0 | 1
// 11   | 0 | 1 | 1 | 1
// 10   | 1 | 1 | 0 | 0
// minimal SoP: (~b * ~c) + (~a * ~d) + (a * c * d) + (~a * b * c)

module top_module (
    input a, b, c, d,
    output out
);
    assign out = (~b & ~c) | (~a & ~d) | (a & c & d) | (~a & b & c);
endmodule