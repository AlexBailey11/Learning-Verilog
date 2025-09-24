// given module (flip flop)
// module my_dff ( input clk, input d, output q ); endmodule
// implement three sequential flip flops

module top_module ( 
    input clk,
    input d,
    output q
);
    wire dff_inst1_to_2;
    wire dff_inst2_to_3;

    // connects input to inst1 to inst2 to inst3 to output
    my_dff inst1 (.clk(clk), .d(d), .q(dff_inst1_to_2));
    my_dff inst2 (.clk(clk), .d(dff_inst1_to_2), .q(dff_inst2_to_3));
    my_dff inst3 (.clk(clk), .d(dff_inst2_to_3), .q(q));
endmodule