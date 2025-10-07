//implement a 8 D flip-flops, all triggered on the same posedge clk.

module top_module #(
    parameter NUM = 8
)(
    input clk,
    input [NUM-1:0] d,
    output [NUM-1:0] q
);
    always @(posedge clk) begin
        q[NUM-1:0] <= d[NUM-1:0];
    end
endmodule