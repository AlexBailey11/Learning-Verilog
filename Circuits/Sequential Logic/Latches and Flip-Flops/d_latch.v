//implement a D latch.

module top_module (
    input d, ena,
    output q
);
    always @(*) begin
        if (ena)
            q <= d;
        else
            q <= q;
    end
endmodule