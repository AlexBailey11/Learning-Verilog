//implement a 12-hour clock using a fast clock and enable pulses to control increment.
//reset should reset clock to 12 AM and has higher priority than enable.
//hours, minutes, and seconds are each two BCD digits.

module top_module (
    input clk, reset, ena,
    output pm,
    output [7:0] hh, mm, ss
);
    //create intermediate wires to drive hours and minutes enable pins
    wire hours_ena, minutes_ena;
    //create wires for loading values for each counter
    wire hours_load_en, minutes_load_en, seconds_load_en;
    wire [7:0] hours_load, minutes_load, seconds_load;

    //create intermediate wires for hours resetting when wrapping
    wire hours_load_en_wrap;
    wire [7:0] hours_load_wrap;

    //instantiate each 2-digit bcd counter for hours, minutes, seconds
    bcd2 hours (
        .clk(clk),
        .reset(1'b0),  //hours will never be reset to 00, so must use load and load_en
        .enable(hours_ena),
        .load_en(hours_load_en), 
        .load(hours_load),
        .q(hh)
    );
    bcd2 minutes (
        .clk(clk),
        .reset(reset),
        .enable(minutes_ena),
        .load_en(minutes_load_en),
        .load(minutes_load),
        .q(mm)
    );
    bcd2 seconds (
        .clk(clk),
        .reset(reset),
        .enable(ena),
        .load_en(seconds_load_en),
        .load(seconds_load),
        .q(ss)
    );

    //create pm logic
    always @(posedge clk) begin
        if (reset) begin
            pm <= 1'b0; //reset to AM
        end
        else begin  //swap of am and pm
            if (hh == 8'h11 && mm == 8'h59 && ss == 8'h59)
                pm <= ~pm;
            else
                pm <= pm;
        end
    end

    //create hours reset logic
    always @(*) begin
        if (reset) begin
            //load 12 into hours counter when reset
            hours_load_en = 1'b1;
            hours_load[7:0] = 8'h12;
        end
        else begin
            //otherwise use wrapping logic if reset is needed
            hours_load_en = hours_load_en_wrap;
            hours_load[7:0] = hours_load_wrap;
        end
    end

    //create wrapping and enable logic
    always @(*) begin
        if (ena && ss[7:0] == 8'h59) begin
            //if at 59 seconds, enable minutes and reset seconds
            minutes_ena = 1'b1;
            seconds_load_en = 1'b1;
            seconds_load[7:0] = 8'h00;
        end
        else begin
            minutes_ena = 1'b0;
            seconds_load_en = 1'b0;
            seconds_load[7:0] = 8'hxx;
        end

        if (minutes_ena && mm[7:0] == 8'h59) begin
            //if at 59 minutes, enable hours and reset minutes
            hours_ena = 1'b1;
            minutes_load_en = 1'b1;
            minutes_load[7:0] = 8'h00;
        end
        else begin
            hours_ena = 1'b0;
            minutes_load_en = 1'b0;
            minutes_load[7:0] = 8'hxx;
        end

        if (hours_ena && hh[7:0] == 8'h12) begin
            //reset hours to 1
            hours_load_en_wrap = 1'b1;
            hours_load_wrap = 8'h01;
        end
        else begin
            hours_load_en_wrap = 1'b0;
            hours_load_wrap = 8'hxx;
        end
    end
endmodule

//two-digit bcd counter
module bcd2 (
    input clk, reset, enable, load_en,
    input [7:0] load,
    output [7:0] q
);
    always @(posedge clk) begin
        if (reset) begin
            q <= 8'b0;
        end
        else if (load_en) begin
            q <= load;
        end
        else if (enable) begin
            if (q[3:0] == 4'd9) begin
                q[3:0] <= 4'd0;
                q[7:4] <= q[7:4] + 4'b1;
            end
            else
                q <= q + 8'b1;
        end
        else
            q <= q;
    end
endmodule