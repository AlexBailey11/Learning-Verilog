//implement a 32-bit edge capture where each output captures whether each corresponding input has a falling edge.
//acts like an SR ff, as once set only reset will return its state back to 0.

module top_module (
    input clk, reset,
    input [31:0] in,
    output [31:0] out
);
    //create wire vector for output of dffs
    wire [31:0] qout;

    //instantiate 32 dffs
    genvar i;
    generate
        for (i = 0; i < 32; i++) begin : dff_arr
            dff inst (.clk(clk), .d(in[i]), .q(qout[i]));
        end
    endgenerate

    //create output logic
    always @(posedge clk) begin
        if (reset)
            out[31:0] <= 32'b0;
        else begin
            for (integer j=0; j<32; j++) begin
                out[j] <= out[j] | (qout[j] & ~in[j]);
            end
        end
    end
endmodule