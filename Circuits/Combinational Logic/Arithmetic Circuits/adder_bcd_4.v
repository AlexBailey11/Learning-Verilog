//implement a 4-bit BCD adder provided the below 1-digit bcd adder
// module bcd_fadd (
//     input [3:0] a,
//     input [3:0] b,
//     input     cin,
//     output   cout,
//     output [3:0] sum
// );
// endmodule

module top_module #(
    parameter DIGITS = 4
)(
    input [DIGITS*4-1:0] a, b,
    input cin,
    output cout,
    output [DIGITS*4-1:0] sum
);
    //create intermediate wires
    wire [DIGITS:0] cin_arr;
    assign cin_arr[0] = cin;
    assign cout = cin_arr[DIGITS];

    genvar i;
    generate
        for (i = 0; i < DIGITS; i++) begin : adder_arr
            bcd_fadd adder (
                .a(a[DIGITS*i+3:DIGITS*i]),
                .b(b[DIGITS*i+3:DIGITS*i]),
                .cin(cin_arr[i]),
                .cout(cin_arr[i+1]),
                .sum(sum[DIGITS*i+3:DIGITS*i])
            );
        end
    endgenerate
endmodule