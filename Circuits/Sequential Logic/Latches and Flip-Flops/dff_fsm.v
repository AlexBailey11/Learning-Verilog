//implement the given FSM with three Dffs.
//D0: x xor Q0
//D1: x and ~Q1
//D2: x or ~Q2
//output Z: ~(Q0 + Q1 + Q2)

module top_module (
    input clk, x,
    output z
);
    //create necessary intermediate wires
    wire d0, d1, d2, q0, q1, q2;

    //instantiate 3 dffs
    dff ff0 (.clk(clk), .d(d0), .q(q0));
    dff ff1 (.clk(clk), .d(d1), .q(q1));
    dff ff2 (.clk(clk), .d(d2), .q(q2));

    //create logic for inputs
    assign d0 = x ^ q0;
    assign d1 = x & ~q1;
    assign d2 = x | ~q2;

    //create output logic
    assign z = ~(q0 | q1 | q2);
endmodule

// module dff (
//     input clk, d,
//     output q
// );
//     always @(posedge clk) begin
//         q <= d;
//     end
// endmodule