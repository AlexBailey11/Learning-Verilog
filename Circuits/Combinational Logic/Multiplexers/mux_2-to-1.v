//for inputs a, b, and sel, select input a when sel = 0, and input b when sel = 1.

// module top_module (
//     input a, b, sel,
//     output out
// );
//     assign out = (sel) ? b : a;
// endmodule

//implement a 2-to-1 mux for bux width inputs a and b.

module top_module #(
    parameter WIDTH = 100
)(
    input [WIDTH-1:0] a, b,
    input sel,
    output [WIDTH-1:0] out
);
    assign out = (sel) ? b : a;
endmodule
