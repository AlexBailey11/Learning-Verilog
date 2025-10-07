//implement a module that contains a flip-flop and multiplexer

// module top_module (
//     input clk, L, r_in, q_in,
//     output reg Q
// );
//     always @(posedge clk) begin
//         Q <= (L) ? r_in : q_in;
//     end
// endmodule

//implement a module that acts as a single bit shift register for a larger shift register

module top_module (
    input clk, w, R, E, L,
    output Q
);
    //logic for the input D to the Dff
    wire D;
    always @(*) begin
        if (L)
            D = R;
        else
            D = (E) ? w : Q;
    end

    always @(posedge clk) begin
        Q <= D;
    end
endmodule