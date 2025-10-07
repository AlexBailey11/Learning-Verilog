//implement a jk flip-flop with a dff and gates. A jk flip-flop has the below truth table where Qold is the output
//of the dff before the positive clock edge

module top_module (
    input clk, j, k,
    output Q
);
    //create intermediate wires
    wire din, qout;

    //instantiate dff
    dff flip_flop (.clk(clk), .d(din), .q(qout));

    //create logic for din and qout
    always @(*) begin
        case ({j,k})
            2'b00: din = qout;
            2'b01: din = j;
            2'b10: din = j;
            2'b11: din = ~qout;
        endcase
    end

    assign Q = qout;
endmodule

//assumed access to the following dff implementation
// module dff (
//     input clk, d,
//     output q
// );
//     always @(posedge clk) begin
//         q <= d;
//     end
// endmodule