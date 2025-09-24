// given the following module
// module mod_a (input in1, input in2, output out); endmodule

module top_module ( input a, input b, output out );
    /*
     * uses position-based instantiation. Assigns a, b, and out to the three ports of module mod_a by their
     * position in the declaration.
     */
    // mod_a instance1 (a, b, out);

    /* 
     * uses name-based instantiation. Assigns a, b, and out to the three ports of module mod_a by their name,
     * irrespective of position in declaration.
     */
    mod_a instance2 (.out(out), .in1(a), .in2(b));
endmodule
