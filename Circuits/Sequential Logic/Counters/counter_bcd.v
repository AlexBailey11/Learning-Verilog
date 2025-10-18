// implement a 4-digit BCD counter where each digit is encoded using 4 bits.

module top_module (
    input clk, reset,   //synchronous active-high reset
    output [3:1] ena,
    output [15:0] q
);
    //instantiate four single digit bcd counters
    bcd1 ones (clk, 1'b1, reset, q[3:0]);
    bcd1 tens (clk, ena[1], reset, q[7:4]);
    bcd1 hunds (clk, ena[2], reset, q[11:8]);
    bcd1 thous (clk, ena[3], reset, q[15:12]);

    //create enable logic
    assign ena[1] = (q[3:0] == 4'd9) ? 1'b1 : 1'b0;
    assign ena[2] = (ena[1] && q[7:4] == 4'd9) ? 1'b1 : 1'b0;
    assign ena[3] = (ena[2] && q[11:8] == 4'd9) ? 1'b1 : 1'b0;
endmodule

module bcd1 (
    input clk, enable, reset,
    output [3:0] q
);
    always @(posedge clk) begin
        if (reset || (q == 4'd9 && enable))
            q <= 4'b0;
        else if (enable)
            q <= q + 4'b1;
        else
            q <= q;
    end
endmodule