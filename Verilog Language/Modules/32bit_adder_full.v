//given module add16 (input[15:0] a, input [15:0] b, input cin, output[15:0] sum, output cout);
//must implement a 32 bit adder which creates two instances of add16, which each create 16 instances of add1 (custom add1 module).
//add1 must have following declaration: module add1 (input a, input b, input, cin, output sum, output cout);

module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    //create wire to go between adders (cout to cin)
    wire low_cout_to_high_cin;
    //instantiate two 16bit adders
    add16 adder_low (   //adder for the lower 16 bits of the inputs
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum[15:0]),
        .cout(low_cout_to_high_cin)
    );

    add16 adder_high (  //adder for the higher 16 bits of the inputs
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(low_cout_to_high_cin),
        .sum(sum[31:16])
        //leave cout unassigned, not needed here
    );
endmodule

module add1 (
    input a, input b, input cin, output sum, output cout
);
    assign sum = a ^ b ^ cin;   //from k-map giving sum = (!cin & (a ^ b)) + (cin & !(a ^ b))
    assign cout = (a & b) | (cin & (a ^ b));    //from k-map giving cout = (a & b) + (cin & b) + (cin & a)
endmodule