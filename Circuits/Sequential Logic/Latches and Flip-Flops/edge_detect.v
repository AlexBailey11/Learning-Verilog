//given an 8-bit input vector, detect when a signal changes from 0 to 1 in back to back clock cycles.

// module top_module (
//     input clk,
//     input [7:0] in,
//     output [7:0] pedge
// );
//     //create array of wires for intermediate logic
//     wire [7:0] qout;

//     //generate 8 flip flops to store previous state of input
//     genvar i;
//     generate
//         for (i = 0; i < 8; i++) begin : dff_arr
//             dff inst (.clk(clk), .d(in[i]), .q(qout[i]));
//         end
//     endgenerate

//     //create output logic
//     always @(posedge clk) begin
//         for (integer j = 0; j < 8; j++) begin
//             pedge[j] <= ~qout[j] & in[j];
//         end
//     end
// endmodule

//given an 8-bit input vector, detect when a signal changes from either 0 to 1 or 1 to 0 in back to back clock cycles.
//That is, detect both positive and negative edges for each of the input signals in the vector.

module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    //create array of wires for intermediate logic
    wire [7:0] qout;

    //generate 8 flip flops to store previous state of input
    genvar i;
    generate
        for (i = 0; i < 8; i++) begin : dff_arr
            dff inst (.clk(clk), .d(in[i]), .q(qout[i]));
        end
    endgenerate

    //create output logic
    always @(posedge clk) begin
        for (integer j = 0; j < 8; j++) begin
            anyedge[j] <= qout[j] ^ in[j];
        end
    end
endmodule