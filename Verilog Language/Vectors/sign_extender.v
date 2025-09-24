/*
 * Implements a 8 to 32 bit sign extender. Uses the replication operator to copy MSB 24 times.
 * Then concatenates the actual 8 bit number itself onto the end.
 */
module sign_extender_8to32 (
    input [7:0] in,
    output [31:0] out );

    assign out = {{24{in[7]}}, in[7:0]};
endmodule