//given 2 byte input, assert the correct ouptut (of 4) without implicitly creating any latches.
module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up
);
    always @(*) begin
        //ensure everything has a default value of 0, then override in case statement as needed
        up = 1'b0; down = 1'b0; left = 1'b0; right = 1'b0;
        case (scancode[15:0])
            16'he06b: left = 1'b1;
            16'he072: down = 1'b1;
            16'he074: right = 1'b1;
            16'he075: up = 1'b1;
        endcase
    end
endmodule