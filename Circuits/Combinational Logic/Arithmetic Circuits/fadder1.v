//create a full adder
module fadder1 (
    input a, b, cin,
    output cout, sum
);
    assign sum = a ^ b ^ cin; //simplification of k-map output: (!cin & (a ^ b)) + (cin & !(a ^ b))
    assign cout = (a & b) | (cin & (a ^ b));    //simplification of k-map output: (a & b) + (cin & b) + (cin & a)
endmodule