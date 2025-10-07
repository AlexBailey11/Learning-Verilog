//implement the following 4 variable kmap
// cd\ab 00  01  11  10
// 00   | 0 | 1 | 0 | 1
// 01   | 1 | 0 | 1 | 0
// 11   | 0 | 1 | 0 | 1
// 10   | 1 | 0 | 1 | 0
//minimal SoP: (!a * b * !c * !d) + (a * !b * !c * !d) + (!a * !b * !c * d) + (a * b * !c * d) + (!a * b * c * d)
//              + (a * !b * c * d) + (!a * !b * c * !d) + (a * b * c * !d)
//minimal expression: a ^ b ^ c ^ d

module top_module (
    input a, b, c, d,
    output out
);
    assign out = a ^ b ^ c ^ d;
endmodule