//implement the following 4 variable kmap
// cd\ab 00  01  11  10
// 00   | 0 | 0 | 0 | 1
// 01   | 1 | 0 | 0 | 0
// 11   | 1 | 0 | 1 | 0
// 10   | 1 | 0 | 0 | 1
//corresponding binary values: 
//using a 4-to-1 mux controlled by the bits ab, implement a module that takes in c and d as inputs
//and outputs the correct logic. Additionally, only implement using 2-to-1 mux.

module top_module (
    input c, d,
    output [3:0] mux_in
);
    //ab = 01 always results in a 0 output
    assign mux_in[1] = 1'b0;

    //logic for mux_in[0]: c or d
    mux c_or_d (.in0(c), .in1(1'b1), .sel(d), .out(mux_in[0]));

    //logic for mux_in[2]: not d
    mux not_d (.in0(1'b1), .in1(1'b0), .sel(d), .out(mux_in[2]));

    //logic for mux_in[3]: c and d
    mux c_and_d (.in0(1'b0), .in1(c), .sel(d), .out(mux_in[3]));

endmodule

module mux (
    input in0, in1, sel,
    output out
);
    assign out = (sel == 1'b0) ? in0 : in1;
endmodule