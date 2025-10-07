//implement a circuit that functionally behaves as a dual-edge triggered ff.
//idea is to have two flip flops, one on positive edge, the other on negative edge.
//then use a mux to select output

module top_module (
    input clk, d,
    output q
);
    //create intermediate wires
    wire q0, q1;

    always @(posedge clk) begin
        q0 <= d;
    end

    always @(negedge clk) begin
        q1 <= d;
    end

    //implement mux for selector
    always @(*) begin
        q = (clk) ? q0 : q1;
    end
endmodule