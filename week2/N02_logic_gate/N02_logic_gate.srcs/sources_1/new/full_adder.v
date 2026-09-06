`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: full_adder
// Description: 1-bit Full Adder using Half Adder sub-modules
//////////////////////////////////////////////////////////////////////////////////

// Sub-module: Half Adder (HA)
module HA (
    input  wire x,
    input  wire y,
    output wire s,
    output wire c
);
    assign s = x ^ y;
    assign c = x & y;
endmodule

// Top module: Full Adder
module full_adder (
    input  wire DIP1, // Input A
    input  wire DIP2, // Input B
    input  wire DIP3, // Input Cin
    output wire LED1, // Sum
    output wire LED2  // Cout
);

    wire s1, c1, c2;

    HA u1 (
        .x(DIP1),
        .y(DIP2),
        .s(s1),
        .c(c1)
    );

    HA u2 (
        .x(s1),
        .y(DIP3),
        .s(LED1),
        .c(c2)
    );

    assign LED2 = c1 | c2;

endmodule
