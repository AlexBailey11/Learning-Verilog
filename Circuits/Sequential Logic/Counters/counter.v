//implement a 4-bit counter which counts from 0 to 15. Reset is active-high and synchronous.

module top_module #(
    parameter WIDTH = 4
)(
    input clk, reset,
    output [WIDTH-1:0] q
);
    always @(posedge clk) begin
        if (reset)
            q <= {WIDTH{1'b0}};
        else
            q <= q + 1'b1;
    end
endmodule