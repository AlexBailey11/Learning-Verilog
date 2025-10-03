//implement a 100-bit binary adder

module top_module #(
    parameter WIDTH = 100
)(
    input [WIDTH-1:0] a, b,
    input cin,
    output cout,
    output [WIDTH-1:0] sum
);
    //create intermediate wire to carry sum + cout
    wire [WIDTH:0] cout_sum;
    assign cout_sum = a + b + cin;
    assign cout = cout_sum[WIDTH];
    assign sum = cout_sum[WIDTH-1:0];
endmodule