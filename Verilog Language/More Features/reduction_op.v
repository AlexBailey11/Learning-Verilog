//reduction operators are unary operators that can perform AND, OR, and XOR on the bits of a vector
//given input vector, output an addition parity bit that takes the xor of the input bits
// module top_module (
//     input [7:0] in,
//     output parity); 
//     assign parity = ^ in[7:0];
// endmodule

//make 100-input AND, OR, and XOR gates
module top_module( 
    input [99:0] in,
    output out_and,
    output out_or,
    output out_xor 
);
    assign out_and = & in[99:0];
    assign out_or = | in[99:0];
    assign out_xor = ^ in[99:0];
endmodule