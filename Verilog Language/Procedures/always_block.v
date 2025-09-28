//assign statement vs combinational always block
// module top_module(
//     input a, 
//     input b,
//     output wire out_assign,
//     output reg out_alwaysblock
// );
//     //assign statement
//     assign out_assign = a & b;

//     always @(*) begin
//         out_alwaysblock = a & b;
//     end
// endmodule

//clocked always block
// IMPORTANT: use non-blocking assignments while in a clocked always block.
//            deals with the way Verilog simulates function.

module top_module (
    input clk,
    input a,
    input b,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff
);
    assign out_assign = a ^ b;

    always @(*) begin
        out_always_comb = a ^ b;
    end

    always @(posedge clk) begin
        out_always_ff <= a ^ b;
    end
endmodule
