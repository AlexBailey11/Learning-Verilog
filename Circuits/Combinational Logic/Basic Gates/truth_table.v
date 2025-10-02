//given 3-input, 1-output function, implement a canonical SoP.
// f (x,y,z) = (~x & y & ~z) + (~x & y & z) + (x & ~y & z) + (x & y & z)

module top_module (
    input x3, x2, x1,
    output f
);
    assign f = (~x3 & x2 & ~x1) | (~x3 & x2 & x1) | (x3 & ~x2 & x1) | (x3 & x2 & x1);
endmodule