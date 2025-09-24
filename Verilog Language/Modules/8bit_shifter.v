//given module my_dff8
// module moduleName (
//     input clk, input [7:0] d, output [7:0] q
// );
// endmodule

module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] inst1_2;
    wire [7:0] inst2_3; 
    wire [7:0] inst3_out;
    my_dff8 inst1 (.clk(clk), .d(d), .q(inst1_2));
    my_dff8 inst2 (.clk(clk), .d(inst1_2), .q(inst2_3));
    my_dff8 inst3 (clk, inst2_3, inst3_out);

    always @(*) begin
        case (sel[1:0])
            2'b00: q <= d[7:0];
            2'b01: q <= inst1_2;
            2'b10: q <= inst2_3;
            2'b11: q <= inst3_out;
        endcase
    end
endmodule
