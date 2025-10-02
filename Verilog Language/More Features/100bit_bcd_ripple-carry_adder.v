//given a bcd one-digit adder: bcd_fadd, implement a 100-bit bcd ripple-carry adder
// module bcd_fadd ( input [3:0] a, input [3:0] b, input cin, output cout, output [3:0] sum );

module top_module (
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum
);
    wire [100:0] cin_to_cout;
    assign cin_to_cout[0] = cin;
    assign cout = cin_to_cout[100];

    genvar i;
    generate
        for (i = 0; i < 100; i++) begin : adder_arr
            bcd_fadd adder (
                .a(a[4*i+3:4*i]),
                .b(b[4*i+3:4*i]),
                .cin(cin_to_cout[i]),
                .cout(cin_to_cout[i+1]),
                .sum(sum[4*i+3:4*i])
            );
        end
    endgenerate
endmodule