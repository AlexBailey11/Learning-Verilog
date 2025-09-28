//Notes: each case item can only execute one statement, unless surrounded by begin/end.
//       duplicate / partially overlapping case items are allowed, and in that case the first one that matches is used.

//implements a 6-to-1 mux with a zero output if sel not in range 0-5.

// module top_module (
//     input [2:0] sel,
//     input [3:0] data0,
//     input [3:0] data1,
//     input [3:0] data2,
//     input [3:0] data3,
//     input [3:0] data4,
//     input [3:0] data5,
//     output reg [3:0] out
// );
//     always @(*) begin
//         case (sel[2:0])
//             3'b000: out = data0;     //also equivalent to say 3'd0, 3'd1, 3'd2, etc.
//             3'b001: out = data1;
//             3'b010: out = data2;
//             3'b011: out = data3;
//             3'b100: out = data4;
//             3'b101: out = data5;
//             default: out = 4'b0;
//         endcase
//     end
// endmodule


//implements a 4-bit LSB priority encoder
// module top_module (
//     input [3:0] in,
//     output reg [1:0] pos
// );
//     always @(*) begin
//         case (in[3:0])
//             4'h0, 4'h1, 4'h3, 4'h5, 4'h7, 4'h9, 4'hb, 4'hd, 4'hf: pos = 2'h0;
//             4'h2, 4'h6, 4'ha, 4'he: pos = 2'h1;
//             4'h4, 4'hc: pos = 2'h2;
//             4'h8: pos = 2'h3;
//             default: pos = 2'h0;
//         endcase
//     end
// endmodule


//Note: casez statement provides easier implementation of priority encoder, due to allowing use of 'z' (don't care) bits
//implements a 8-bit LSB priority encoder using casez statement.
module top_module (
    input [7:0] in,
    output reg [2:0] pos
);
    always @(*) begin
        casez (in[7:0])
            8'bzzzzzzz1: pos = 3'd0;
            8'bzzzzzz10: pos = 3'd1;
            8'bzzzzz100: pos = 3'd2;
            8'bzzzz1000: pos = 3'd3;
            8'bzzz10000: pos = 3'd4;
            8'bzz100000: pos = 3'd5;
            8'bz1000000: pos = 3'd6;
            8'b10000000: pos = 3'd7;
            default: pos = 3'd0;
        endcase
    end
endmodule