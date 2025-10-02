//implement the following logic for a 100-bit input vector
//out_both: each bit should be high if its corresponding input bit and its left neighbor are high
//out_any: each bit should be high if its corresponding input bit or its right neighbor are high
//out_different: each bit should be high if its corresponding input bit or its left neighbor are high, exclusively, and with wrap around.

module top_module #(
    parameter WIDTH = 100
)(
    input [WIDTH-1:0] in,
    output [WIDTH-2:0] out_both,
    output [WIDTH-1:1] out_any,
    output [WIDTH-1:0] out_different
);
    always @(*) begin
        out_both = {WIDTH-1{1'b0}};
        out_any = {WIDTH-1{1'b0}};
        out_different = {WIDTH{1'b0}};

        //override out_both with high outputs
        for (integer i = 0; i < WIDTH-1; i++) begin
            if (in[i] & in[i+1])
                out_both[i] = 1'b1;
        end

        //override out_any with high outputs
        for (integer i = 1; i < WIDTH; i++) begin
            if (in[i] | in[i-1])
                out_any[i] = 1'b1;
        end

        //override out_different with high outputs
        for (integer i = 0; i < WIDTH; i++) begin
            if (in[i] ^ in[(i + 1) % WIDTH])
                out_different[i] = 1'b1;
        end
    end
endmodule