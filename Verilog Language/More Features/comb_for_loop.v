//given 100-bit input, reverse the bit ordering.
module top_module( 
    input [99:0] in,
    output [99:0] out
);
    always @(*) begin
        for (integer i = 0; i < 100; i++) begin
            out[i] <= in[99-i];
        end
    end
endmodule