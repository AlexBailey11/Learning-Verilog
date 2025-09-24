//given module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
//make a 32bit adder that is quicker than before using a mux to select between outputs of two diff higher 16 bit adders.
//One assumes cin = 0, other cin = 1. Cout from lower 16bit adder determines which to use.

module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    //wires
    wire adder_low_to_mux_sel;  //adder_low.cout to mux.sel
    wire [15:0] adder_high_0_to_mux_16bit;   //adder_high_0.sum to mux.input0
    wire [15:0] adder_high_1_to_mux_16bit;   //adder_high_1.sum to mux.input1

    //instantiate 3 16bit adders and a mux
    add16 adder_low (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum[15:0]),
        .cout(adder_low_to_mux_sel)
    );
    add16 adder_high_0 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b0),         //assumes adder_low.cout is 0
        .sum(adder_high_0_to_mux_16bit),
        .cout(1'bz)     //sets cout to high impedance, don't need it
    );
    add16 adder_high_1 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b1),         //assumes adder_low.cout is 1
        .sum(adder_high_1_to_mux_16bit),
        .cout(1'bz)     //sets cout to high impedance, don't need it
    );

    mux_16bit_2to1 mux (
        .input0(adder_high_0_to_mux_16bit),
        .input1(adder_high_1_to_mux_16bit),
        .sel(adder_low_to_mux_sel),
        .out(sum[31:16])
    );
endmodule

//16bit 2-to-1 mux
module mux_16bit_2to1 (
    input [15:0] input0,
    input [15:0] input1,
    input sel,
    output [15:0] out
);
    always @(*) begin
        if (sel)
            out <= input1;  //sets output to input1 if sel is 1
        else
            out <= input0;  //sets output to input0 if sel is 0
    end
endmodule