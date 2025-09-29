//given a 255-bit input, count the number of 1's in the input.
module top_module( 
    input [254:0] in,
    output [7:0] out );

    always @(*) begin
        out = 0;
        for (integer i = 0; i < 255; i++) begin
            if (in[i] == 1'b1) begin
                out = out + 8'd1;
            end
        end
    end
endmodule