//implements a 3-bit binary ripple-carry adder based on my implementation of a full adder.

//full adder
module fadder (
    input a, b, cin,
    output cout, sum
);
    assign sum = a ^ b ^ cin; //simplification of k-map output: (!cin & (a ^ b)) + (cin & !(a ^ b))
    assign cout = (a & b) | (cin & (a ^ b));    //simplification of k-map output: (a & b) + (cin & b) + (cin & a)
endmodule

//3-bit binary ripple-carry adder
module top_module (
    input [2:0] a, b,
    input cin,
    output [2:0] cout, sum
);
    fadder add0 (
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .cout(cout[0]),
        .sum(sum[0])
    );
    fadder add1 (
        .a(a[1]),
        .b(b[1]),
        .cin(cout[0]),
        .cout(cout[1]),
        .sum(sum[1])
    );
    fadder add2 (
        .a(a[2]),
        .b(b[2]),
        .cin(cout[1]),
        .cout(cout[2]),
        .sum(sum[2])
    );
endmodule