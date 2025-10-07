//implement 8 D flip-flops with an active high, synchronous reset.

// module top_module #(
//     parameter NUM = 8
// )(
//     input clk,
//     input reset,
//     input [NUM-1:0] d,
//     output [NUM-1:0] q
// );
//     always @(posedge clk) begin
//         q[NUM-1:0] <= (reset) ? {NUM{1'b0}} : d[NUM-1:0];
//     end
// endmodule

//implement 8 D flip-flops with an active high, synchronous reset. The reset value should be to 0x34 instead of 0.
//additionally, these flip-flops should all be triggered by the falling edge of the clk

// module top_module (
//     input clk,
//     input reset,
//     input [7:0] d,
//     output [7:0] q
// );
//     always @(negedge clk) begin
//         q[7:0] <= (reset) ? 8'h34 : d[7:0];
//     end
// endmodule

//implement 8 D flip-flops with an active high, asynchronous reset. Triggered once again by the positive edge of the clock

module top_module (
    input clk,
    input areset,
    input [7:0] d,
    output [7:0] q
);
    always @(posedge clk, posedge areset) begin
        q[7:0] <= (areset) ? 8'b0 : d[7:0];
    end
endmodule