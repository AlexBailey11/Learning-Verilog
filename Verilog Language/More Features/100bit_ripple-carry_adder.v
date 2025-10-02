//based on my 1-bit full adder implementation, implement a 100-bit binary ripple-carry adder
module top_module (
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum
);
    //instantiate the first adder
    genvar i;
    generate
        for (i = 0; i < 100; i++) begin : adder_arr
            fadder1 adder (
                .a(a[i]), .b(b[i]),
                .cin(i == 0 ? cin : cout[i-1]),
                .cout(cout[i]),
                .sum(sum[i])
            );
        end
    endgenerate
endmodule

//full adder implementation:
module fadder1 (
    input a, b, cin,
    output cout, sum
);
    assign sum = a ^ b ^ cin; //simplification of k-map output: (!cin & (a ^ b)) + (cin & !(a ^ b))
    assign cout = (a & b) | (cin & (a ^ b));    //simplification of k-map output: (a & b) + (cin & b) + (cin & a)
endmodule