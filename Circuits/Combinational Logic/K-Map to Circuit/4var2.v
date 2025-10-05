//implement the following 4 variable kmap
// cd\ab 01  00  10  11
// 00   | X | 0 | 1 | 1
// 01   | 0 | 0 | X | X
// 11   | 0 | 1 | 1 | 1
// 10   | 0 | 1 | 1 | 1
//minimal SoP: (a) + (c * ~b)

module top_module (
    input a, b, c, d,
    output out
);
    assign out = a | (c & ~b);
endmodule