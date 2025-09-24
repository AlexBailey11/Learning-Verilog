//given module add16 (input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout);

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cin_upper;
    wire [15:0] a_upper, a_lower;
    wire [15:0] b_upper, b_lower;
    wire [15:0] sum_upper, sum_lower;
    
    assign a_upper = a[31:16];
    assign a_lower = a[15:0];
    assign b_upper = b[31:16];
    assign b_lower = b[15:0];
    assign sum = {sum_upper, sum_lower};

    add16 inst1 (a_upper, b_upper, cin_upper, sum_upper);
    add16 inst2 (a_lower, b_lower, 1'b0, sum_lower, cin_upper);

endmodule
