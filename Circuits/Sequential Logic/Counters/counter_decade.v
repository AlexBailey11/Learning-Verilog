//implement a decade counter (0-9) with a synchronous reset.

// module top_module (
//     input clk, reset,
//     output [3:0] q
// );
//     always @(posedge clk) begin
//         if (reset | q[3:0] == 4'd9)
//             q <= 4'b0;
//         else
//             q <= q + 1'b1;
//     end
// endmodule

//implement a decade counter (1-10) with a synchronous reset.

// module top_module (
//     input clk, reset,
//     output [3:0] q
// );
//     always @(posedge clk) begin
//         if (reset | q[3:0] == 4'd10)
//             q <= 4'd1;
//         else
//             q <= q + 1'b1;
//     end
// endmodule

//implement a decade counter (0-9) with synchronous reset. Slowena input should indicate when to increment the counter

module top_module (
    input clk, reset, slowena,
    output [3:0] q
);
    always @(posedge clk) begin
        if (reset | (q[3:0] == 4'd9 & slowena))
            q <= 4'b0;
        else if (slowena)
            q <= q + 1'b1;
        else
            q <= q;
    end
endmodule