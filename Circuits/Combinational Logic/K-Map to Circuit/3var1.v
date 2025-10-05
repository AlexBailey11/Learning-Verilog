//implement the k-map for three variables
// bc\a 0   1
// 00 | 0 | 1 |
// 01 | 1 | 1 |
// 11 | 1 | 1 |
// 10 | 1 | 1 |
// minimal SoP expression: (a) + (b) + (c)
// minimal PoS expression: (a + b + c)

module top_module (
    input a, b, c,
    output out
);
    assign out = a | b | c;
endmodule