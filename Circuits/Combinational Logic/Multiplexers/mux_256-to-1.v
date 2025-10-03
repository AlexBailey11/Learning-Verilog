//implement a 1-bit wide, 256-to-1 mux

// module top_module (
//     input [255:0] in,
//     input [7:0] sel,
//     output out
// );
//     assign out = in[sel];
// endmodule

//implement a 4-bit wide, 256-to-1 mux. All inputs are packed together in a single vector

module top_module #(
    parameter WIDTH = 4
)(
    input [WIDTH*256 - 1:0] in,
    input [7:0] sel,
    output [WIDTH-1:0] out
);
    always @(*) begin
        for (integer i = 0; i < WIDTH; i++) begin
            out[i] = in[sel*WIDTH + i];
        end
    end
endmodule