//implement a D flip-flop.

// module top_module (
//     input clk,
//     input d,
//     output reg q
// );
//     always @(posedge clk) begin
//         q <= d;
//     end
// endmodule

//implement a D flip-flop with a xor gate controlling the D input such that D = in xor Q.

module top_module (
    input clk, in,
    output out
);
    reg q;
    always @(posedge clk) begin
        q <= q ^ in;
    end
    assign out = q;
endmodule