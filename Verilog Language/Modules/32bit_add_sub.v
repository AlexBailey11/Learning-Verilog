//given module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
//make a 32 bit adder and subtractor. Uses a XOR gate to optionally invert an input for subtraction.

module top_module (
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    //create wires
    wire [31:0] xor_out_32bit;
    wire low_cout_to_high_cin;

    //two add16 instances
    add16 adder_low (
        .a(a[15:0]),
        .b(xor_out_32bit[15:0]),
        .cin(sub),
        .sum(sum[15:0]),
        .cout(low_cout_to_high_cin)
    );
    add16 adder_high (
        .a(a[31:16]),
        .b(xor_out_32bit[31:16]),
        .cin(low_cout_to_high_cin),
        .sum(sum[31:16]),
        .cout(1'bz)     //don't care about high cout, high impedance
    );

    //create b ^ sub
    assign xor_out_32bit = b ^ {32{sub}};
endmodule