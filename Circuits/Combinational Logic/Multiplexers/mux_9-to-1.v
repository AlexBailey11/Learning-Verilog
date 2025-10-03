//16-bit 9-to-1 mux given 16-bit inputs a through i. If sel is out of range (9...15), all output bits are 1.

module top_module #(
    parameter WIDTH = 16
)(
    input [WIDTH-1:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output [WIDTH-1:0] out
);
    always @(*) begin
        case (sel)
        4'b0000: out = a;
        4'b0001: out = b;
        4'b0010: out = c;
        4'b0011: out = d;
        4'b0100: out = e;
        4'b0101: out = f;
        4'b0110: out = g;
        4'b0111: out = h;
        4'b1000: out = i;
        default: out = {WIDTH{1'b1}};
        endcase
    end
endmodule