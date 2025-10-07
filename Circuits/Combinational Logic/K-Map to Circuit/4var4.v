//implement the following 4 variable kmap
// cd\ab 00  01  11  10
// 00   | X | 0 | X | X
// 01   | 0 | X | 1 | 0
// 11   | 1 | 1 | X | X
// 10   | 1 | 1 | 0 | X
//minimal SoP: (!a * c) + (b * d)

module top_module (
    input [4:1] x,
    output f
);
    assign f = (~x[1] & x[3]) | (x[2] & x[4]);
endmodule