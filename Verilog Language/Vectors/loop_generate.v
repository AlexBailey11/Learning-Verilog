/*
 * Basic description of a bit-swapper between in and out.
 * first is verbose, second is better using vectors,
 * third uses procedural for loop, and fourth uses generate for loop
 */
module bit_swapper( 
    input [7:0] in,
    output [7:0] out
);

    // assign {out[7], out[6], out[5],
    // out[4], out[3], out[2], out[1],
    // out[0]} = {in[0], in[1], in[2],
    // in[3], in[4], in[5], in[6], in[7]};

    // better
    // assign {out[0], out[1], out[2], out[3], out[4], out[5], out[6], out[7]} = in;

    // with looping
    // always @(*) begin
        // for (integer i = 0; i < 8; i++)
            // out[i] = in[8-i-1];
    // end

    // with generate block
    generate
        genvar i;
        for (i = 0; i < 8; i++)
        begin: for_block
            assign out[i] = in[8-i-1];
        end
    endgenerate
endmodule
