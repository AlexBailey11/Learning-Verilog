module top_module (
    input in1, in2, in3,
    output out
);
    assign out = in3 ^ ~(in1 ^ in2);
endmodule