//implement 16 D flip-flops which have a byte enable, where each bit of the byte enable signal controls a specified byte.
//the reset is active-low and synchronous

module top_module (
    input clk, resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    always @(posedge clk) begin
        //split up based on bytes
        if (~resetn)
            q <= 16'b0;
        else begin
            q[15:8] <= (byteena[1]) ? d[15:8] : q[15:8];
            q[7:0] <= (byteena[0]) ? d[7:0] : q[7:0];
        end
    end
endmodule