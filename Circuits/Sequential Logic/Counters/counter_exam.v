//implement a 1-12 counter with inputs and outputs:
//reset - active-high, synchronous, and resets to 1
//enable - counter only runs when high
//clk - posedge triggered
//Q[3:0] - output of counter
//c_enable, c_load, c_d[3:0] - internal control signals going to 4-bit counter

//given logic gates and following 4-bit binary counter
// module count4(
// 	input clk,
// 	input enable,
// 	input load,
// 	input [3:0] d,
// 	output reg [3:0] Q
// );

module top_module (
    input clk, reset, enable,
    output c_enable, c_load,
    output [3:0] Q, c_d
);
    //instantiate counter
    count4 inst (.clk(clk), .enable(c_enable), .load(c_load), .d(c_d), .Q(Q));

    assign c_enable = enable;
    assign c_d = 4'b1;

    //create intermediate value for c_load
    wire Q_load;

    always @(*) begin
        if (reset)
            c_load = 1'b1;
        else
            c_load = Q_load;
        
        if (Q[3:0] == 4'hc && c_enable)
            Q_load = 1'b1;
        else
            Q_load = 1'b0;
    end
endmodule