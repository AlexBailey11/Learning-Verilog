//if statement creates a mux where one signal is chosen when condition is true, and the other when condition is false.
//equivalent to using an assign statement using ternary operator.

// module top_module (
//     input a,
//     input b,
//     input sel_b1,
//     input sel_b2,
//     output wire out_assign,
//     output reg out_always
// );
//     assign out_assign = (sel_b1 & sel_b2) ? b : a ; //assigns out to be b if both sel_b1 and sel_b2 are high, a otherwise

//     always @(*) begin
//         if (sel_b1 & sel_b2) begin
//             out_always = b;
//         end
//         else begin
//             out_always = a;
//         end
//     end
// endmodule

// IMPORTANT: beware of accidentally creating latches, which happens when Verilog assumes you want to keep the outputs
//            unchanged if you do not assign an output to a wire in ALL cases
//given faulty code; fix it to NOT create latches
module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving
);

    always @(*) begin
        if (cpu_overheated)
           shut_off_computer = 1'b1;
        else
            shut_off_computer = 1'b0;
    end

    always @(*) begin
        if (~arrived)
           keep_driving = ~gas_tank_empty;
        else
            keep_driving = 1'b0;
    end

endmodule
