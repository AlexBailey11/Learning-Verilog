//implement the following logic with both a minimal SoP and PoS
// ab\cd 00  01  11  10
// 00   | 0 | 0 | X | 1
// 01   | 0 | 0 | 1 | 0
// 11   | X | 0 | 1 | 0
// 10   | X | 0 | X | 0
//minimal SoP: (c * d) + (!a * !b * c)
//minimal PoS: (c) * (!a + d) * (!b + d)

module top_module (
    input a, b, c, d,
    output out_sop, out_pos
);
    assign out_sop = (c & d) | (~a & ~b & c);
    assign out_pos = c & (~a | d) & (~b | d);
endmodule