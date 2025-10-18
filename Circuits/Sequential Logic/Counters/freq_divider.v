//implement a frequency divider than can be used to step down a 1000Hz clk signal to a 1Hz signal.
//given the following bcd counter
// module bcdcount (
// 	input clk,
// 	input reset,
// 	input enable,
// 	output reg [3:0] Q
// );


module top_module (
    input clk, reset,
    output OneHertz,
    output [2:0] c_enable
);
    //fastest counter should always be active
    assign c_enable[0] = 1'b1;

    //create wires for output of each counter
    wire [11:0] c_out;

    //use each bcd counter to step down the input clk by a factor of 10
    bcdcount counter0 (clk, reset, c_enable[0], c_out[3:0]);
    bcdcount counter1 (clk, reset, c_enable[1], c_out[7:4]);
    bcdcount counter2 (clk, reset, c_enable[2], c_out[11:8]);

    assign c_enable[1] = (c_out[3:0] == 4'd9) ? 1'b1 : 1'b0;
    assign c_enable[2] = (c_enable[1] && c_out[7:4] == 4'd9) ? 1'b1 : 1'b0;
    assign OneHertz = (c_enable[1] && c_enable[2] && c_out[11:8] == 4'd9) ? 1'b1 : 1'b0;
endmodule