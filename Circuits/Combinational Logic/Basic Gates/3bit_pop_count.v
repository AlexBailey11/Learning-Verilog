//implement a population counter for a 3bit input
module top_module (
    input [2:0] in,
    output [1:0] out
);
    always @(*) begin
        out = 2'b0;
        for (integer i = 0; i < 3; i++) begin
            if (in[i] == 1'b1)
                out = out + 1'b1;
        end
    end
endmodule